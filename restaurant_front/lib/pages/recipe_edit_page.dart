import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/pages/material_list_page.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 菜品配方编辑页面
@RoutePage()
class RecipeEditPage extends ConsumerStatefulWidget {
  const RecipeEditPage({super.key, this.recipe, this.onSave});

  final Recipe? recipe;

  final void Function(Recipe)? onSave;

  @override
  ConsumerState<RecipeEditPage> createState() => _RecipeEditPageState();
}

class _RecipeEditPageState extends ConsumerState<RecipeEditPage> {
  late final Recipe _recipe;

  /// 是否编辑了
  bool _hasEdited = false;

  Widget _buildTitle() {
    if (widget.recipe == null) {
      // 添加新配方
      return Text('新配方');
    } else {
      // 编辑配方
      return Text('编辑配方');
    }
  }

  Widget _buildAddMaterialButton() {
    return FilledButton(
      onPressed: () {
        debugPrint("路由栈RecipeEditRoute(添加配料): ${router.stack.map((e) => e.name).toList()}");
        router.push(
          MaterialListRoute(
            title: "配料选择",
            onTapMaterialItem: (material, usage) {
              // 检查配料是否已经添加
              for (final ma in _recipe.materials) {
                if (material.id == ma.material.id) {
                  Fluttertoast.showToast(msg: "该配料已添加!");
              router.back();
                  return;
                }
              }
              setState(() {
                final recipeMaterial = RecipeMaterial(
                  material: material,
                  quantity: usage,
                );
                _recipe.materials.add(recipeMaterial);
              });
              router.back();
            },
          ),
        );
      },
      child: Text("添加配料"),
    );
  }

  Widget _buildSaveButton() {
    return FilledButton(onPressed: (){
      widget.onSave?.call(_recipe);
      debugPrint("当前路由栈: ${router.stack.map((e) => e.name).toList()}");
      router.back();
      debugPrint("back后路由栈: ${router.stack.map((e) => e.name).toList()}");
    }, child: Text("保存"));
  }

  Widget _buildNoMaterialView() {
    return Column(
      children: [
        Text("点击下方按钮添加配料", style: TextStyle(color: Colors.grey)),
        _buildAddMaterialButton(),
      ],
    );
  }

  Widget _buildMaterialDataView() {
    if (_recipe.materials.isEmpty) {
      return _buildNoMaterialView();
    }
    final List<Widget> children = [];
    int index = 0;
    for (final material in _recipe.materials) {
      final _index = index; // 如果没有这一行，removeAt的闭包捕获会失败
      children.add(
        ListTile(
          title: Text(material.material.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${material.quantity} ${Utils.getMaterialUnitTextByMaterial(material.material)}",
              ),
              SizedBox(width: 10,),
              Chip(label: Text("用量",), padding: EdgeInsets.zero, side: BorderSide(color: Colors.blueAccent), backgroundColor: Colors.blueAccent.withAlpha(100),),
              IconButton(onPressed: (){
                setState(() {
                  _recipe.materials.removeAt(_index);
                });
              }, icon: Icon(Icons.close))
            ],
          ),
          onTap: () {
            GlobalDialog.showCustom<String>(builder: (context, controller) {
              return UsageInputDialog(
                controller: controller,
                unitType: material.material.unitType,
                title: "修改 ${material.material.name} 用量",
                initUsage: material.quantity.d().toStringAsFixed(2),
                onConfirm: (usage) {
                  setState(() {
                    _recipe.materials[_index].quantity = usage;
                  });
                },
              );
            });
          },
        ),
      );
      index++;
    }
    children.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAddMaterialButton(),
          _buildSaveButton()
        ],
      )
    );
    return Column(children: children);
  }

  @override
  void didUpdateWidget(covariant RecipeEditPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.recipe == widget.recipe) return;
    if (widget.recipe == null) {
      setState(() {
        _recipe = Recipe();
      });
      return;
    }
    setState(() {
      _recipe = widget.recipe!;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _recipe = widget.recipe!;
    } else {
      _recipe = Recipe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        router.back();
      },
      child: Scaffold(
        appBar: AppBar(title: _buildTitle(), leading: IconButton(onPressed: (){
          router.back();
        }, icon: Icon(Icons.arrow_back)),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FormSection(
                          title: Text("添加配料"),
                          content: _buildMaterialDataView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
