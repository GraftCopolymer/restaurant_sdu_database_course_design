import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/network/cost_service.dart';
import 'package:restaurant_management/src/generated/cost_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/types.pbenum.dart';
import 'package:restaurant_management/utils/text_formatter.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:fixnum/fixnum.dart';

/// 成本添加页面
@RoutePage()
class CostAddPage extends StatefulWidget {
  const CostAddPage({super.key, this.onSuccess});

  final VoidCallback? onSuccess;

  @override
  State<CostAddPage> createState() => _CostAddPageState();
}

class _CostAddPageState extends State<CostAddPage> {
  CostType _selectedCostType = CostType.COST_TYPE_UNKNOWN;
  final _descController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _date = DateTime.now();

  /// 上传后端
  Future<void> _submit() async {
    // 数据校验
    if (_descController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "请输入成本项描述");
      return;
    }
    if (_selectedCostType == CostType.COST_TYPE_UNKNOWN) {
      Fluttertoast.showToast(msg: "请选择成本类型");
      return;
    }
    if (_valueController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "请输入成本金额");
      return;
    }
    // 校验输入的金额格式是否合法
    final value = double.tryParse(_valueController.text.trim());
    if (value == null) {
      Fluttertoast.showToast(msg: "请输入合法的数字");
      return;
    }
    try {
      final req = AddCostItemReq(
        costType: _selectedCostType,
        value: _valueController.text.trim(),
        desc: _descController.text.trim(),
        createdAt: Int64(_date.millisecondsSinceEpoch ~/ 1000)
      );
      await CostService.client.addCostItem(req);
      widget.onSuccess?.call();
      Fluttertoast.showToast(msg: "添加成功");
    } on GrpcError catch (e, s) {
      Utils.report(e, s);
      Fluttertoast.showToast(msg: "添加失败: ${e.message}");
    }
  }

  List<DropdownMenuEntry<CostType>> _buildDropdownMenuEntries() {
    final Map<CostType, String> costTypeLabels = {
      CostType.COST_TYPE_ELECTRICITY: "电费",
      CostType.COST_TYPE_WATER: "水费",
      CostType.COST_TYPE_EQUIPMENT: "设备成本",
      CostType.COST_TYPE_GAS: "天然气",
      CostType.COST_TYPE_CONSUMABLE: "消耗品成本",
      CostType.COST_TYPE_MARKETING: "营销成本",
      CostType.COST_TYPE_RENT: "租金",
      CostType.COST_TYPE_MANAGEMENT: "行政管理费",
    };

    final ret = costTypeLabels.entries
        .map(
          (entry) =>
              DropdownMenuEntry<CostType>(value: entry.key, label: entry.value),
        )
        .toList();

    ret.insert(
      0,
      DropdownMenuEntry(
        enabled: false,
        value: CostType.COST_TYPE_UNKNOWN,
        label: "请选择",
      ),
    );

    return ret;
  }

  String _getFormattedDateText(DateTime dateTime) {
    final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
    return formatter.format(dateTime);
  }

  Widget _buildFormBody() {
    return Column(
      children: [
        FormSection(
          title: Text("成本项描述"),
          content: TextField(
            controller: _descController,
            decoration: InputDecoration(hintText: "请输入成本项描述"),
          ),
        ),
        FormSection(
          title: Text("成本项类型"),
          content: LayoutBuilder(
            builder: (context, constraints) {
              return DropdownMenu<CostType>(
                width: constraints.maxWidth,
                menuHeight: 300,
                initialSelection: _selectedCostType,
                dropdownMenuEntries: _buildDropdownMenuEntries(),
                onSelected: (value) {
                  if (value != null) {
                    _selectedCostType = value;
                  }
                },
              );
            },
          ),
        ),
        FormSection(
          title: Text("金额"),
          content: TextField(
            controller: _valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              // 限制只能输入两位小数
              DecimalTextInputFormatter(),
            ],
            decoration: InputDecoration(hintText: "请输入成本金额", suffix: Text("￥")),
          ),
        ),
        FormSection(
          title: Text("成本产生日期"),
          content: FilledButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2000 + 100),
              );
              if (date == null) {
                return;
              }
              setState(() {
                _date = date;
              });
            },
            child: Text(_getFormattedDateText(_date)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("添加成本项"), leading: BackButton()),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(child: _buildFormBody()),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          _submit();
                        },
                        child: Text("提交"),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
