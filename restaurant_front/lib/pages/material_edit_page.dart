import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/providers/material_edit_provider.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart' as pb;
import 'package:restaurant_management/src/generated/restaurantV2/types.pb.dart';
import 'package:restaurant_management/utils/text_formatter.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/form_section.dart';

@RoutePage()
class MaterialEditPage extends ConsumerStatefulWidget {
  const MaterialEditPage({super.key, this.material, this.onSubmit});

  /// 传入本字段则为编辑模式
  final pb.Material? material;

  /// 提交成功时调用
  final void Function(pb.Material)? onSubmit;

  @override
  ConsumerState<MaterialEditPage> createState() => _MaterialEditPageState();
}

class _MaterialEditPageState extends ConsumerState<MaterialEditPage> {
  MaterialEditProvider get provider => materialEditProvider(widget.material);

  final DropdownMenuEntry<UnitType> _initDropdownEntry = DropdownMenuEntry(
    enabled: false,
    value: UnitType.UINT_TYPE_UNKNOWN,
    label: "请选择",
  );

  UnitType _currentUnitType = UnitType.UINT_TYPE_UNKNOWN;

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _amountController = TextEditingController();

  String _getTitleText() {
    if (widget.material != null) {
      return "编辑配料";
    }
    return "新增配料";
  }

  String _getPriceSuffixText() {
    final unitText = Utils.getMaterialUnitText(_currentUnitType);
    if (unitText.isEmpty) {
      return "";
    }
    return "元/$unitText";
  }

  List<DropdownMenuEntry<UnitType>> _buildUnitTypeDropdownMenuEntries() {
    return [
      _initDropdownEntry,
      DropdownMenuEntry(value: UnitType.UINT_TYPE_MASS, label: "重量"),
      DropdownMenuEntry(value: UnitType.UINT_TYPE_VOLUME, label: "体积"),
      DropdownMenuEntry(value: UnitType.UINT_TYPE_PER, label: "份数"),
    ];
  }

  Future<void> _submitMaterial() async {
    // 数据校验
    if (_nameController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg:"请输入配料名称");
      return;
    }
    if (_currentUnitType == UnitType.UINT_TYPE_UNKNOWN) {
      Fluttertoast.showToast(msg: "请选择计量单位");
      return;
    }
    if (_priceController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "请输入配料单价");
      return;
    }
    try {
      Decimal.parse(_amountController.text.trim());
    } catch (e) {
      Fluttertoast.showToast(msg: "请输入正确的数字");
      return;
    }
    final material = widget.material?.deepCopy() ?? pb.Material();
    material.name = _nameController.text.trim();
    material.unitType = _currentUnitType;
    material.price = _priceController.text.trim();
    material.amount = _amountController.text.trim();
    try {
      final req = pb.CreateOrEditMaterialReq(
        material: material,
      );
      final resp = await DishService.client.createOrEditMaterial(req);
      material.id = resp.materialId;
      ref.read(provider.notifier).updateMaterial(material);
      widget.onSubmit?.call(material);
      Fluttertoast.showToast(msg: "修改成功");
      // 返回上一级页面
      router.back();
    } on GrpcError catch(e, stackTrace) {
      Utils.report(e, stackTrace);
      Fluttertoast.showToast(msg: "添加配料失败");
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.material != null) {
      _nameController.text = widget.material!.name;
      _priceController.text = widget.material!.price;
      _amountController.text = widget.material!.amount.toString();
      _currentUnitType = widget.material!.unitType;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("当前选择的单位类型: $_currentUnitType");
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(_getTitleText())),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _nameController,
                              style: TextStyle(
                                fontSize: Theme.of(
                                  context,
                                ).textTheme.titleLarge!.fontSize,
                              ),
                              decoration: InputDecoration(hintText: "请输入配料名称"),
                            ),
                            SizedBox(height: 20),
                            FormSection(
                              title: Text("计量单位"),
                              content: DropdownMenu(
                                initialSelection: _currentUnitType,
                                dropdownMenuEntries:
                                    _buildUnitTypeDropdownMenuEntries(),
                                onSelected: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _currentUnitType = value;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            if (_currentUnitType != UnitType.UINT_TYPE_UNKNOWN)
                              FormSection(
                                title: Text("配料单价"),
                                content: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: width * 0.7,
                                    child: TextField(
                                      controller: _priceController,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                            decimal: true,
                                          ),
                                      inputFormatters: [
                                        DecimalTextInputFormatter()
                                      ],
                                      decoration: InputDecoration(
                                        hintText: "输入单价",
                                        suffix: Text(_getPriceSuffixText()),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_currentUnitType != UnitType.UINT_TYPE_UNKNOWN)
                              FormSection(
                                title: Text("总量"),
                                content: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: width * 0.7,
                                    child: TextField(
                                      controller: _amountController,
                                      keyboardType:
                                          _currentUnitType ==
                                              UnitType.UINT_TYPE_PER
                                          ? TextInputType.number
                                          : TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                      inputFormatters: [
                                        // 选择份数时只允许输入整数
                                        if (_currentUnitType ==
                                            UnitType.UINT_TYPE_PER)
                                          FilteringTextInputFormatter
                                              .digitsOnly, // 只允许输入 0-9
                                      ],
                                      decoration: InputDecoration(
                                        hintText: "请输入总量, 不填默认为0",
                                        suffix: Text(
                                          Utils.getMaterialUnitText(
                                            _currentUnitType,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(height: 10,),
                            FilledButton(onPressed: (){
                              _submitMaterial();
                            }, child: Text("提交"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

