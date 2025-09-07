import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/employee_list_provider.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/employee_service.pb.dart'
    as pb;
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/expandable_fab.dart';

@RoutePage()
class EmployeeManagementPage extends ConsumerStatefulWidget {
  const EmployeeManagementPage({super.key});

  @override
  ConsumerState<EmployeeManagementPage> createState() =>
      _EmployeeManagementPageState();
}

class _EmployeeManagementPageState extends ConsumerState<EmployeeManagementPage>
    with WidgetsBindingObserver {
  AutoDisposeAsyncNotifierProvider<EmployeeListModel, List<pb.EmployeeInfo>>
  get provider => employeeListModelProvider;

  final _employeeSearchCon = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final _focusNode = FocusNode();

  /// 记录上一帧键盘高度, 用来判断键盘是收起还是展开
  double _lastKeyboardHeight = 0;

  /// 搜索计时器, 不为null说明正在搜索
  Timer? _searchTimer;

  /// 有数据时的视图
  Widget _buildDataView(List<EmployeeInfo> employees) {
    if (employees.isEmpty) {
      return SliverFillRemaining(child: const Center(child: Text("没有数据")));
    }
    return SliverList.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final asyncCurrentUserInfo = ref.watch(userInfoModelProvider);
        final employee = employees[index];
        return asyncCurrentUserInfo.when(
          data: (userInfo) {
            // 隐藏自己
            if (userInfo.userId == employee.id) {
              return SizedBox.shrink();
            }
            return ListTile(
              title: Text(employee.name),
              subtitle: Text(employee.role.name),
              onTap: () {
                router.push(
                  EmployeeDetailRoute(
                    employeeId: employee.id,
                    onUpdated: () async {
                      if (mounted) {
                        // 刷新数据
                        await ref
                            .read(provider.notifier)
                            .refresh(keywords: _employeeSearchCon.text.trim());
                      }
                    },
                    onDelete: () async {
                      await ref
                          .read(provider.notifier)
                          .refresh(keywords: _employeeSearchCon.text.trim());
                      // 返回
                      router.back();
                    },
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            Utils.report(error, stackTrace);
            return Center(child: Text("登录状态加载错误"));
          },
          loading: () => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  /// 加载中视图
  Widget _buildLoadingView() {
    return SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  /// 错误视图
  Widget _buildErrorView(Object? error) {
    return SliverFillRemaining(child: Center(child: Text("加载失败")));
  }

  /// 构建管理员菜单
  Widget _buildAdminMenu() {
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case "add employee":
            // 跳转到员工添加页面
            router.push(
              EmployeeAddRoute(
                onAddEmployee: () {
                  ref
                      .read(provider.notifier)
                      .refresh(keywords: _employeeSearchCon.text.trim());
                },
              ),
            );
            break;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<String>(value: "add employee", child: Text("添加新员工")),
        ];
      },
    );
  }

  Future<void> _refresh() async {
    final p = ref.read(provider.notifier);
    await p.refresh(keywords: _employeeSearchCon.text);
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // 绑定搜索框变化事件
    _employeeSearchCon.addListener(() {
      _searchTimer?.cancel(); // 如果有, 先取消
      setState(() {
        _searchTimer = null;
      });
      // 如果用户清除了所有文本, 则直接刷新
      if (_employeeSearchCon.text.isEmpty) {
        ref.read(employeeListModelProvider.notifier).refresh();
        return;
      }
      _searchTimer = Timer(Duration(seconds: 1), () {
        _searchTimer?.cancel();
        setState(() {
          _searchTimer = null;
        });
        // 先停止先前的所有刷新任务
        ref.read(provider.notifier).stopAllRefreshTask();
        ref.read(provider.notifier).refresh(keywords: _employeeSearchCon.text);
      });
      // 滚动到最顶端
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        ref.read(provider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("员工管理"),
          actions: [_buildAdminMenu()],
          leading: BackButton(),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return _refresh();
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverAppBar(
                expandedHeight: 90,
                collapsedHeight: 90,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.0,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _employeeSearchCon,
                            keyboardType: TextInputType.webSearch,
                            onSubmitted: (value) {
                              _focusNode.unfocus();
                            },
                            onTapOutside: (event) {
                              _focusNode.unfocus();
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: "员工姓名/手机号",
                              suffixIcon: _searchTimer == null
                                  ? Icon(Icons.search)
                                  : UnconstrainedBox(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final employeeList = ref.watch(employeeListModelProvider);
                  switch (employeeList) {
                    case AsyncData(:final value):
                      return _buildDataView(value);
                    case AsyncError(:final error):
                      return _buildErrorView(error);
                    case AsyncLoading():
                      return _buildLoadingView();
                    default:
                      return _buildErrorView(null);
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: ExpandableFab(
          icon: Icon(Icons.more_horiz),
          distance: 100,
          children: [
            ActionButton(
              onPressed: () {
                // 跳转到员工添加页面
                router.push(
                  EmployeeAddRoute(
                    onAddEmployee: () {
                      ref
                          .read(provider.notifier)
                          .refresh(keywords: _employeeSearchCon.text.trim());
                    },
                  ),
                );
              },
              icon: Icon(Icons.add),
            ),
            ActionButton(onPressed: () {
              // 跳转发薪界面
              router.push(PaySalaryRoute());
            }, icon: Icon(Icons.attach_money_rounded)),
          ],
        ),
      ),
    );
  }
}
