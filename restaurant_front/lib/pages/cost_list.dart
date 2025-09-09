import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/providers/cost_list_provider.dart';
import 'package:restaurant_management/src/generated/types.pbenum.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/expandable_fab.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

@RoutePage()
class CostListPage extends ConsumerStatefulWidget {
  const CostListPage({super.key, this.costType});

  final CostType? costType;

  @override
  ConsumerState<CostListPage> createState() => _CostListPageState();
}

class _CostListPageState extends ConsumerState<CostListPage> {
  CostListNotifierProvider get provider =>
      costListNotifierProvider(widget.costType);

  // 是否是编辑模式
  bool _edit = false;
  // 选中的项
  List<int> _selectedIds = [];

  Widget _buildBody() {
    final asyncCostList = ref.watch(provider);
    return asyncCostList.when(
      data: (costList) {
        if (costList.isEmpty) {
          return Center(child: Text("暂无数据"));
        }
        return ListView.builder(
          itemCount: costList.length,
          itemBuilder: (context, index) {
            final costInfo = costList[index];
            // 获取日期
            final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
            final dateString = formatter.format(
              DateTime.fromMillisecondsSinceEpoch(
                costInfo.createdAt.toInt() * 1000,
              ),
            );
            return ListTile(
              title: Text(costInfo.description),
              trailing: Text("${costInfo.value}￥"),
              subtitle: Text(dateString),
              onTap: _edit
                  ? () {
                      final selected = _selectedIds.contains(costInfo.costId);
                      setState(() {
                        print(1 + 1);
                        if (selected) {
                          _selectedIds.remove(costInfo.costId);
                        } else {
                          _selectedIds.add(costInfo.costId);
                        }
                      });
                    }
                  : null,
              leading: _edit
                  ? Checkbox(
                      value: _selectedIds.contains(costInfo.costId),
                      onChanged: (selected) {
                        setState(() {
                          if (selected ?? false) {
                            _selectedIds.add(costInfo.costId);
                          } else {
                            _selectedIds.remove(costInfo.costId);
                          }
                        });
                      },
                    )
                  : null,
            );
          },
        );
      },
      error: (e, s) {
        Utils.report(e, s);
        return Center(child: Text("错误: ${e is GrpcError ? e.message : ''}"));
      },
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("成本管理"),
          leading: BackButton(),
          actions: [
            TextButton(
              child: _edit ? Text("取消") : Text("编辑"),
              onPressed: () {
                // 进入/退出 编辑模式
                setState(() {
                  // 清空已经选择的ids
                  _selectedIds.clear();
                  _edit = !_edit;
                });
              },
            ),
          ],
        ),
        body: _buildBody(),
        floatingActionButton: _edit
            ? FloatingActionButton(
                onPressed: () async {
                  if (_selectedIds.isEmpty) {
                    Fluttertoast.showToast(msg: "请先选择需要删除的条目");
                    return;
                  }
                  final controller = GlobalDialog.showCustom(
                    builder: (context, controller) {
                      return AlertDialog(
                        title: Text("确认操作"),
                        content: Text("确认要删除这些成本记录吗, 无法撤销!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              controller.setResult(DialogResult.cancel);
                              controller.dismiss();
                            },
                            child: Text("取消"),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.setResult(DialogResult.confirm);
                              controller.dismiss();
                            },
                            child: Text("确认"),
                          ),
                        ],
                      );
                    },
                  );
                  if (await controller?.getResult() != DialogResult.confirm) {
                    return;
                  }
                  await ref.read(provider.notifier).deleteByIds(_selectedIds);
                },
                child: Icon(Icons.delete_forever_outlined),
              )
            : null
      ),
    );
  }
}
