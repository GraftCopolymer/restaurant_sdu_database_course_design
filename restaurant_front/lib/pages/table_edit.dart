import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/providers/table_edit_provider.dart';
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/form_section.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart'
    show Seat, Table, CreateOrEditTableReq;
import 'package:restaurant_management/widgets/global_dialog.dart';

@RoutePage()
class TableEditPage extends ConsumerStatefulWidget {
  const TableEditPage({super.key, this.title, this.table, this.onSaveSuccess});

  final String? title;

  final Table? table;

  final VoidCallback? onSaveSuccess;

  @override
  ConsumerState<TableEditPage> createState() => _TableEditPageState();
}

class _TableEditPageState extends ConsumerState<TableEditPage> {
  TableEditNotifierProvider get provider =>
      tableEditNotifierProvider(widget.table);

  final _tableNumberController = TextEditingController();

  Widget _buildSeatsFormSectionContent() {
    final table = ref.watch(provider);
    final List<Widget> seatWidgetList = [];
    Widget seatWidgetBuilder(BuildContext context, int index) {
      if (index == table.seats.length) {
        return FilledButton(
          onPressed: () {
            GlobalDialog.showCustom(
              builder: (context, controller) {
                return _SeatEditDialog(
                  provider: provider,
                  controller: controller,
                );
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("添加座位"), Icon(Icons.add)],
          ),
        );
      }
      final seat = table.seats[index];
      return ListTile(
        title: Text("座位号: ${seat.seatNumber}"),
        trailing: IconButton(
          onPressed: () {
            // 删除
            ref.read(provider.notifier).deleteByIndex(index);
          },
          icon: Icon(Icons.delete_forever_outlined),
        ),
        onTap: () {
          // 淦，要写不完了。。。。。。。
          GlobalDialog.showCustom(
            builder: (context, controller) {
              return _SeatEditDialog(
                provider: provider,
                controller: controller,
                seat: seat,
                index: index,
              );
            },
          );
        },
      );
    }

    for (int index = 0; index < table.seats.length + 1; index++) {
      seatWidgetList.add(seatWidgetBuilder(context, index));
    }
    return Column(children: seatWidgetList);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _tableNumberController.text = ref.watch(provider).number;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "餐桌编辑"),
          leading: BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FormSection(
                        title: Text("餐桌编号"),
                        content: TextField(
                          controller: _tableNumberController,
                          decoration: InputDecoration(hintText: "请输入餐桌编号"),
                        ),
                      ),
                      FormSection(
                        title: Text("座位"),
                        content: _buildSeatsFormSectionContent(),
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth * 0.8,
                    child: FilledButton.icon(
                      onPressed: () async {
                        // TODO: 保存至后端
                        // 检查桌号是否为空
                        if (_tableNumberController.text.trim().isEmpty) {
                          Fluttertoast.showToast(msg: "桌号不能为空");
                          return;
                        }
                        // 检查是否有座位
                        if (ref.read(provider).seats.isEmpty) {
                          Fluttertoast.showToast(msg: "请至少添加一个座位");
                          return;
                        }
                        try {
                          final editedTable = ref.read(provider).deepCopy();
                          editedTable.number = _tableNumberController.text.trim();
                          final req = CreateOrEditTableReq(
                            table: editedTable,
                          );
                          await DishService.client.createOrEditTable(req);
                          Fluttertoast.showToast(msg: "保存成功");
                          widget.onSaveSuccess?.call();
                        } on GrpcError catch(e, stack) {
                          Utils.report(e, stack);
                          Fluttertoast.showToast(msg: "保存失败: ${e.message}");
                        }
                      },
                      label: Text("保存"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeatEditDialog extends ConsumerStatefulWidget {
  const _SeatEditDialog({
    super.key,
    required this.provider,
    this.controller,
    this.seat,
    this.index,
  });

  final TableEditNotifierProvider provider;
  final DialogController? controller;
  final Seat? seat;
  final int? index;

  @override
  ConsumerState<_SeatEditDialog> createState() => __SeatEditDialogState();
}

class __SeatEditDialogState extends ConsumerState<_SeatEditDialog> {
  final _seatNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    assert(widget.seat == null || widget.index != null);
    if (widget.seat != null) {
      _seatNumberController.text = widget.seat!.seatNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("编辑座位"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "桌号: ${ref.watch(widget.provider).number.isEmpty ? "当前" : ref.watch(widget.provider).number}",
          ),
          TextField(
            controller: _seatNumberController,
            decoration: InputDecoration(hintText: "请输入座位号"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.controller?.dismiss();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () async {
            // TODO: 保存
            // 数据校验
            if (_seatNumberController.text.trim().isEmpty) {
              Fluttertoast.showToast(msg: "请填写座位号");
              return;
            }
            if (widget.seat == null) {
              // 新增
              final addResult = ref
                  .read(widget.provider.notifier)
                  .addSeat(_seatNumberController.text.trim());
              if (!addResult) {
                Fluttertoast.showToast(msg: "座位已存在");
                return;
              }
            } else {
              // 编辑
              final newSeat = Seat()
                ..id = widget.seat!.id
                ..tableId = widget.seat!.tableId
                ..seatNumber = _seatNumberController.text.trim();
              ref
                  .read(widget.provider.notifier)
                  .updateByIndex(newSeat, widget.index!);
            }
            widget.controller?.dismiss();
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}
