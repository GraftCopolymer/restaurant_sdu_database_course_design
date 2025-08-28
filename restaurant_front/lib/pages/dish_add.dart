import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/providers/dish_info_edit_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';
import 'package:restaurant_management/widgets/image_pick_box.dart';
import 'package:restaurant_management/src/generated/restaurantV2/types.pbenum.dart'
    as en;

@RoutePage()
class DishAddPage extends ConsumerStatefulWidget {
  const DishAddPage({super.key, this.onSaveDish, this.dish});

  final void Function(Dish dish)? onSaveDish;
  // 传入 Dish 则为编辑模式
  final Dish? dish;

  @override
  ConsumerState<DishAddPage> createState() => _DishAddPageState();
}

class _DishAddPageState extends ConsumerState<DishAddPage>
    with WidgetsBindingObserver {
  DishInfoEditModelFamily get provider => dishInfoEditModelProvider;

  File? _imageFile;
  bool _hasDishTypeError = false;
  bool _isLoadingDishType = true;
  List<DishType> _dishTypes = [];
  final DishType _emptyDishType = DishType(dishTypeID: 0, name: "aa");
  late DishType _selectedType = _emptyDishType;

  final _dishNameCon = TextEditingController();
  final _focusNode = FocusNode();
  double _lastKeyboardHeight = 0;
  
  void _onUpdatePortionRecipe(Recipe recipe, int index) {
    ref.read(provider(widget.dish).notifier).updateRecipe(recipe, index);
  }

  /// 获取菜品类型
  Future<void> _fetchDishTypes() async {
    setState(() {
      _isLoadingDishType = true;
    });
    try {
      final resp = await DishService.client.getDishType(Empty());
      setState(() {
        _dishTypes = resp.dishTypes;
        _hasDishTypeError = false;
      });
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      setState(() {
        _hasDishTypeError = true;
      });
    } finally {
      setState(() {
        _isLoadingDishType = false;
      });
    }
  }

  List<DropdownMenuEntry<DishType>> _buildDropdownMenuEntries() {
    final res = <DropdownMenuEntry<DishType>>[];
    res.add(
      DropdownMenuEntry(
        enabled: false,
        value: _emptyDishType,
        label: "请选择菜品类型",
      ),
    );
    for (final dishType in _dishTypes) {
      res.add(DropdownMenuEntry(value: dishType, label: dishType.name));
    }
    for (final s in res) {
      debugPrint("当前名称: ${s.value}");
    }
    return res;
  }

  Widget _buildDishTypeDropdownMenu([double? width]) {
    return Stack(
      children: [
        if (_isLoadingDishType)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          ),
        Row(
          children: [
            DropdownMenu<DishType>(
              menuHeight: 200,
              width: width ?? 200,
              initialSelection: _selectedType,
              enabled: !_isLoadingDishType,
              onSelected: (value) {
                if (value == null) return;
                _selectedType = value;
              },
              dropdownMenuEntries: _buildDropdownMenuEntries(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMaterialTagWrap(DishPortion portion) {
    final materialList = portion.recipe.materials;
    final List<Widget> tagList = [];
    for (final ma in materialList) {
      tagList.add(
        Chip(
          side: BorderSide(color: Colors.transparent),
          label: Text(
            "${ma.material.name} ${ma.quantity} ${Utils.getMaterialUnitText(ma.material.unitType)}",
          ),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.green.shade100,
        ),
      );
    }
    return Wrap(spacing: 10, runSpacing: 0, children: tagList);
  }

  Widget _buildPortionEditItem(DishPortion portion, int index) {
    final listLength = ref.read(provider(widget.dish)).portions.length;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          portion.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Theme.of(
                              context,
                            ).textTheme.titleMedium!.fontSize,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Chip(
                        label: Text(
                          Utils.getPortionTypeTagName(portion.portionType),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("价格: "),
                      Chip(label: Text("${portion.price}￥")),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              child: IconButton(
                onPressed: () {
                  GlobalDialog.showCustom(
                    builder: (context, controller) {
                      return EditPortionDialog(
                        controller: controller,
                        portion: portion,
                        index: index,
                        onSuccess: (dishPortion) {
                          ref.read(provider(widget.dish).notifier).updatePortion(dishPortion, index);
                        },
                      );
                    },
                  );
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ],
        ),

        if (!portion.hasRecipe())
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                debugPrint(
                  "路由栈DishAddRoute(添加): ${router.stack.map((e) => e.name).toList()}",
                );
                router.push(
                  RecipeEditRoute(
                    onSave: (recipe) {
                      _onUpdatePortionRecipe(recipe, index);
                    },
                  ),
                );
              },
              child: Text("添加配方"),
            ),
          )
        else
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMaterialTagWrap(portion),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    debugPrint(
                      "路由栈DishAddRoute(编辑): ${router.stack.map((e) => e.name).toList()}",
                    );
                    router.push(
                      RecipeEditRoute(
                        recipe: portion.recipe,
                        onSave: (recipe) {
                          _onUpdatePortionRecipe(recipe, index);
                        },
                      ),
                    );
                  },
                  child: Text("编辑配方"),
                ),
              ),
            ],
          ),

        if (index < listLength - 1) Divider(indent: 20, endIndent: 20),
      ],
    );
  }

  Widget _buildPortionEditSectionContent() {
    final List<Widget> portionWidgetList = [];
    final temp = provider(widget.dish);
    final portionList = ref.watch(
      temp,
    ).portions;
    int index = 0;
    for (final portion in portionList) {
      portionWidgetList.add(_buildPortionEditItem(portion, index));
      index++;
    }
    portionWidgetList.add(
      FilledButton(
        onPressed: () async {
          GlobalDialog.showCustom(
            builder: (context, controller) {
              return EditPortionDialog(
                controller: controller,
                onSuccess: (portion) {
                  ref.read(provider(widget.dish).notifier).addPortion(portion);
                },
              );
            },
          );
        },
        child: Text("添加新份量"),
      ),
    );
    return Column(children: portionWidgetList);
  }

  Widget _buildDishTypeSection() {
    return FormSection(
      title: Text("菜品种类"),
      content: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildDishTypeDropdownMenu(constraints.maxWidth)],
              ),
              if (_hasDishTypeError && !_isLoadingDishType)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _fetchDishTypes();
                        },
                        icon: Row(
                          children: [
                            Text("加载失败", style: TextStyle(color: Colors.red)),
                            Icon(Icons.refresh, color: Colors.red),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
      bottomAlign: MainAxisAlignment.start,
      bottomWidget: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            GlobalDialog.showCustom(
              canClose: false,
              builder: (context, controller) {
                return DishTypeAddDialog(
                  controller: controller,
                  onAddSuccess: (dishType) {
                    setState(() {
                      _dishTypes.add(
                        DishType(
                          dishTypeID: dishType.dishTypeID,
                          name: dishType.name,
                        ),
                      );
                    });
                  },
                );
              },
            );
          },
          child: Text("没有想要的菜品类型? 去添加"),
        ),
      ),
    );
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final keyboardHeight = View.of(context).viewInsets.bottom;
    if (keyboardHeight - _lastKeyboardHeight < 0 && _focusNode.hasFocus) {
      _focusNode.unfocus();
    }
    _lastKeyboardHeight = keyboardHeight;
  }

  void _initEditData() {
    if (widget.dish != null) {
      for (final dt in _dishTypes) {
        if (dt.dishTypeID == widget.dish!.dishType.dishTypeID) {
          _selectedType = dt;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _fetchDishTypes().then((_) {
      _initEditData();
    });
    _dishNameCon.addListener(() {
      // 随时更新provider中的值
      ref.read(provider(widget.dish)).name = (_dishNameCon.text);
    });
  }

  Dish? _getNewDish() {
    if (_dishNameCon.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "请输入菜品名称");
      return null;
    }
    if (_selectedType.dishTypeID == 0) {
      Fluttertoast.showToast(msg: "请选择菜品类型");
      return null;
    }
    final portions = ref.read(provider(widget.dish)).portions;
    if (portions.isEmpty) {
      Fluttertoast.showToast(msg: "请至少添加一种份量");
      return null;
    }
    return Dish(
      id: widget.dish?.id,
      name: _dishNameCon.text.trim(),
      dishType: _selectedType,
      portions: portions,
    );
  }

  Future<void> _uploadDish(Dish newDish) async {
    try {
      final req = CreateOrEditDishReq(dish: newDish);
      await DishService.client.createOrEditDish(req);
      Fluttertoast.showToast(msg: "保存成功");
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      Fluttertoast.showToast(msg: "保存失败: ${e.message}");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final dish = ref.watch(provider(widget.dish));
    _dishNameCon.text = dish.name;
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("添加新菜品"), leading: BackButton(),),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _dishNameCon,
                          focusNode: _focusNode,
                          onSubmitted: (value) {
                            _focusNode.unfocus();
                          },
                          onTapOutside: (event) {
                            _focusNode.unfocus();
                          },
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: Theme.of(
                              context,
                            ).textTheme.headlineMedium!.fontSize,
                          ),
                          decoration: InputDecoration(hintText: "菜品名称"),
                        ),
                        SizedBox(height: 20),
                        FormSection(
                          title: Text("菜品图片"),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImagePickBox(
                                onSuccess: (imageFile) {
                                  _imageFile = imageFile;
                                  debugPrint("当前选择的图片路径: $_imageFile");
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildDishTypeSection(),
                        FormSection(
                          title: Text("可选份量"),
                          content: _buildPortionEditSectionContent(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FilledButton(
                    onPressed: () {
                      final newDish = _getNewDish();
                      if (newDish == null) return;
                      // 上传后端
                      _uploadDish(newDish);
                      widget.onSaveDish?.call(newDish);
                    },
                    child: Text("保存"),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

/// 添加菜品类型对话框
class DishTypeAddDialog extends StatefulWidget {
  const DishTypeAddDialog({
    super.key,
    required this.controller,
    this.onAddSuccess,
  });

  final DialogController controller;
  final void Function(DishType dishType)? onAddSuccess;

  @override
  State<DishTypeAddDialog> createState() => _DishTypeAddDialogState();
}

class _DishTypeAddDialogState extends State<DishTypeAddDialog> {
  final _dishTypeNameCon = TextEditingController();
  String? _tip;

  Future<void> _submitDishType() async {
    final trimedName = _dishTypeNameCon.text.trim();
    if (trimedName.isEmpty) {
      setState(() {
        _tip = "*请输入种类名称";
      });
      return;
    }
    try {
      final req = AddDishTypeReq(typeName: trimedName);
      final resp = await DishService.client.addDishType(req);
      widget.controller.dismiss();
      Fluttertoast.showToast(msg: "添加成功");
      widget.onAddSuccess?.call(
        DishType(dishTypeID: resp.dishTypeID, name: resp.typeName),
      );
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      setState(() {
        _tip = e.message;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: 用户开始输入非空白字符时, 取消错误提示的显示
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("添加新菜品"),
          Icon(Icons.dinner_dining, color: Colors.blue),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _dishTypeNameCon,
            decoration: InputDecoration(hintText: "输入菜品分类名"),
          ),
          Visibility(
            visible: _tip != null,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Row(
              children: [Text(_tip ?? "", style: TextStyle(color: Colors.red))],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.controller.dismiss();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () {
            _submitDishType();
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}

/// 添加菜品份量的对话框
class EditPortionDialog extends StatefulWidget {
  const EditPortionDialog({
    super.key,
    required this.controller,
    this.onSuccess,
    this.portion,
    this.index,
  });

  final DialogController controller;

  final void Function(DishPortion)? onSuccess;

  final DishPortion? portion;
  final int? index;

  @override
  State<EditPortionDialog> createState() {
    return _EditPortionDialogState();
  }
}

class _EditPortionDialogState extends State<EditPortionDialog> {

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  en.DishPortion _selectedPortion = en.DishPortion.DISH_PORTION_UNKNOWN;

  String? _tip;

  void _onSelectPortion(en.DishPortion? p) {
    if (p == null) return;
    setState(() {
      _selectedPortion = p;
    });
    debugPrint("当前选择的份量: $_selectedPortion");
  }

  /// 判断当前是不是编辑模式
  bool _isEditMode() {
    return widget.portion != null;
  }

  Widget _buildRadioBtnList() {
    return Column(
      children: [
        RadioListTile<en.DishPortion>(
          title: Text("小份量"),
          value: en.DishPortion.DISH_PORTION_SMALL,
          groupValue: _selectedPortion,
          onChanged: _onSelectPortion,
        ),
        RadioListTile<en.DishPortion>(
          title: Text("中份量"),
          value: en.DishPortion.DISH_PORTION_MID,
          groupValue: _selectedPortion,
          onChanged: _onSelectPortion,
        ),
        RadioListTile<en.DishPortion>(
          title: Text("大份量"),
          value: en.DishPortion.DISH_PORTION_BIG,
          groupValue: _selectedPortion,
          onChanged: _onSelectPortion,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    assert(
      (widget.portion != null && widget.index != null) ||
          (widget.portion == null && widget.index == null),
    );
    if (widget.portion != null && widget.index != null) {
      _nameController.text = widget.portion!.name;
      _priceController.text = widget.portion!.price;
      _selectedPortion = widget.portion!.portionType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text(_isEditMode() ? "编辑菜品份量" : "添加菜品份量"),
          Icon(Icons.rice_bowl_outlined, color: Colors.blue),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "请输入份量名称"),
            ),
            Visibility(
              visible: _tip != null,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(_tip ?? "", style: TextStyle(color: Colors.red)),
              ),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "请输入份量价格",
                suffix: Text("￥"),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d*'),
                ), // 允许小数点
              ],
            ),
            SizedBox(height: 10),
            Align(alignment: Alignment.centerLeft, child: Text("选择份量大小: ")),
            Align(alignment: Alignment.centerLeft, child: _buildRadioBtnList()),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.controller.dismiss();
          },
          child: Text("取消"),
        ),
        Consumer(
          builder: (context, ref, child) {
            return TextButton(
              onPressed: () async {
                if (_nameController.text.trim().isEmpty) {
                  setState(() {
                    _tip = "*请输入份量名称";
                  });
                  return;
                }
                if (_priceController.text.trim().isEmpty) {
                  Fluttertoast.showToast(msg: "请输入价格");
                  return;
                }
                if (_selectedPortion == en.DishPortion.DISH_PORTION_UNKNOWN) {
                  Fluttertoast.showToast(msg: "请选择份量大小");
                  return;
                }
                late final double price;
                try {
                  price = double.parse(_priceController.text.trim());
                } catch (e, stack) {
                  Utils.report(e, stack);
                  Fluttertoast.showToast(msg: "未知错误");
                  return;
                }
                if (price.toInt() == 0) {
                  final result = await GlobalDialog.show(
                    title: "提示",
                    content: "确定要将价格定为0.0元吗?",
                    cancelText: "取消",
                  );
                  if (result != DialogResult.confirm) {
                    return;
                  }
                }
                debugPrint("解析出的价格: $price");
                widget.controller.dismiss();
                if (_isEditMode()) {
                  final newDishPortion = DishPortion(
                    id: widget.portion!.id,
                    name: _nameController.text.trim(),
                    price: _priceController.text.trim(),
                    portionType: _selectedPortion,
                    recipe: widget.portion!.recipe,
                  );
                  // 编辑模式, 通知外界变化的发生
                  widget.onSuccess?.call(
                    newDishPortion
                  );
                } else {
                  // 不是编辑模式, 通知外界添加了新的条目
                  widget.onSuccess?.call(
                    DishPortion(
                      name: _nameController.text,
                      price: price.toStringAsFixed(2),
                      portionType: _selectedPortion,
                    ),
                  );
                }
              },
              child: Text("确定"),
            );
          },
        ),
      ],
    );
  }
}
