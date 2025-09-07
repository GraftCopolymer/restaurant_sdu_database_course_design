import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/table_list_provider.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/types.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/dashboard_card.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart' as pb;

/// 餐桌列表页面
@RoutePage()
class TableListPage extends ConsumerStatefulWidget {
  const TableListPage({super.key, this.onTableTap, this.title});

  final void Function(pb.Table table)? onTableTap;
  final String? title;

  @override
  ConsumerState<TableListPage> createState() => _TableListPageState();
}

class _TableListPageState extends ConsumerState<TableListPage> {
  AutoDisposeAsyncNotifierProvider<TableListNotifier, List<pb.Table>>
  get provider => tableListNotifierProvider;

  @override
  Widget build(BuildContext context) {
    final _title = widget.title ?? "餐桌列表";
    final screenSize = MediaQuery.of(context).size;
    final asyncValue = ref.watch(provider);
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text(_title), leading: BackButton()),
        body: asyncValue.when(
          data: (tableList) {
            if (tableList.isEmpty) {
              return Center(child: Text("暂无可用餐桌"));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: tableList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenSize.width > screenSize.height ? 4 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final table = tableList[index];
                  return GridViewCard(
                    onTap: ref
                        .watch(userInfoModelProvider)
                        .when(
                          data: (userInfo) {
                            if (userInfo.isCustomer()) {
                              return () {
                                router.push(CustomerSelectDishRoute(
                                  orderType: OrderType.ORDER_TYPE_DINING_IN,
                                  table: table,
                                ));
                              };
                            } else {
                              return (){};
                            }
                          },
                          error: (error, stackTrace) => (){},
                          loading: () => (){},
                        ),
                    onLongPress: ref
                        .watch(userInfoModelProvider)
                        .when(
                          data: (userInfo) {
                            if (userInfo.isEmployee()) {
                              return () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return TableLongPressBottomSheet(
                                      provider: provider,
                                      tableIndex: index,
                                      onSave: () {
                                        if (mounted) {
                                          ref.invalidate(provider);
                                        }
                                        router.back();
                                      },
                                      onDelete: () {
                                        ref
                                            .refresh(provider.notifier)
                                            .deleteTable(index);
                                        // 关闭 bottom sheet
                                        router.back();
                                      },
                                    );
                                  },
                                );
                              };
                            } else {
                              return null;
                            }
                          },
                          error: (error, stackTrace) => null,
                          loading: () => null,
                        ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.table_bar),
                          Text("桌号: ${table.number}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (e, s) {
            Utils.report(e, s);
            return Center(child: Text("加载失败"));
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: ref
            .watch(userInfoModelProvider)
            .when(
              data: (userInfo) {
                if (userInfo.isEmployee()) {
                  return FloatingActionButton(
                    onPressed: () {
                      router.push(
                        TableEditRoute(
                          onSaveSuccess: () {
                            ref.invalidate(provider);
                            // 成功后返回
                            router.back();
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  );
                } else {
                  return null;
                }
              },
              error: (error, stackTrace) {
                Utils.report(error, stackTrace);
                return null;
              },
              loading: () => null,
            ),
      ),
    );
  }
}

/// 管理员长按菜单
class TableLongPressBottomSheet extends StatefulWidget {
  const TableLongPressBottomSheet({
    super.key,
    required this.provider,
    required this.tableIndex,
    this.onSave,
    this.onDelete,
  });

  final AutoDisposeAsyncNotifierProvider<TableListNotifier, List<pb.Table>>
  provider;
  final int tableIndex;
  final VoidCallback? onSave;
  final VoidCallback? onDelete;

  @override
  State<TableLongPressBottomSheet> createState() =>
      _TableLongPressBottomSheetState();
}

class _TableLongPressBottomSheetState extends State<TableLongPressBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      clipBehavior: Clip.antiAlias,
      onClosing: () {},
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return ListTile(
                  title: Text("编辑", textAlign: TextAlign.center),
                  onTap: () {
                    ref
                        .read(widget.provider)
                        .when(
                          data: (tableList) {
                            if (widget.tableIndex >= tableList.length ||
                                widget.tableIndex < 0) {
                              return null;
                            }
                            router.push(
                              TableEditRoute(
                                table: tableList[widget.tableIndex],
                                onSaveSuccess: () {
                                  // 刷新数据
                                  widget.onSave?.call();
                                },
                              ),
                            );
                          },
                          error: (e, s) => null,
                          loading: () => null,
                        );
                    router.pop();
                  },
                );
              },
            ),
            Divider(indent: 10, endIndent: 10),
            Consumer(
              builder: (context, ref, child) {
                return ListTile(
                  title: Text(
                    "删除",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    widget.onDelete?.call();
                  },
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          ],
        );
      },
    );
  }
}
