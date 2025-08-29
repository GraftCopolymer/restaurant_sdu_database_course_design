import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/material_list_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart'
    as pb;
import 'package:restaurant_management/src/generated/restaurantV2/types.pbenum.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

/// 配料列表页面, 可对配料进行各种操作
@RoutePage()
class MaterialListPage extends ConsumerStatefulWidget {
  const MaterialListPage({
    super.key,
    this.title = '配料管理',
    this.onTapMaterialItem,
  });

  /// 标题, 不设置默认为 '配料管理'
  final String title;

  /// 点击配料item后的回调, 默认行为是打开配料信息编辑页面, 传入该函数后将覆盖默认行为
  final void Function(pb.Material material, String usage)? onTapMaterialItem;

  @override
  ConsumerState<MaterialListPage> createState() => _MaterialSelectPageState();
}

class _MaterialSelectPageState extends ConsumerState<MaterialListPage> {
  AutoDisposeAsyncNotifierProvider<MaterialListModel, List<pb.Material>>
  get provider => materialListModelProvider;

  late final ScrollController _scrollController = ScrollController();

  Widget _buildDataView(List<pb.Material> dataList) {
    if (dataList.isEmpty) {
      return _buildNoDataView();
    }
    return ListView.builder(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final material = dataList[index];
        return ListTile(
          onTap: () async {
            debugPrint(
              "路由栈MaterialListRoute(点击item): ${router.stack.map((e) => e.name).toList()}",
            );
            if (widget.onTapMaterialItem != null) {
              // 显示份量选择对话框
              final controller = GlobalDialog.showCustom<String>(
                canClose: false,
                builder: (context, controller) {
                  return UsageInputDialog(
                    unitType: material.unitType,
                    controller: controller,
                  );
                },
              );
              debugPrint(
                "路由栈MaterialListRoute(打开了对话框): ${router.stack.map((e) => e.name).toList()}",
              );
              final usage = await controller?.getResult();
              if (usage == null) {
                Fluttertoast.showToast(msg: "请输入配料用量!");
                return;
              }
              widget.onTapMaterialItem!(material, usage);
              return;
            } else {
              router.push(
                MaterialEditRoute(
                  material: material,
                  onSubmit: (material) {
                    ref.read(provider.notifier).updateMaterial(material, index);
                  },
                ),
              );
            }
          },
          title: Text(material.name),
          subtitle: Text(
            "${material.price} 元/${Utils.getMaterialUnitTextByMaterial(material)}",
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${material.amount} ${Utils.getMaterialUnitTextByMaterial(material)}",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
              SizedBox(width: 5),
              Chip(
                label: Text("余量"),
                side: BorderSide(color: Colors.green),
                backgroundColor: Colors.green.withAlpha(100),
                padding: EdgeInsets.all(0),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorView() {
    return Center(child: Text("获取数据失败"));
  }

  Widget _buildNoDataView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("暂时还没有配料信息"),
          TextButton(
            onPressed: () {
              router.push(
                MaterialEditRoute(
                  onSubmit: (material) {
                    ref.read(provider.notifier).addMaterial(material);
                  },
                ),
              );
            },
            child: Text("去添加"),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingView() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        ref.read(provider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(provider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        router.back();
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title), leading: IconButton(onPressed: (){
          router.back();
        }, icon: Icon(Icons.arrow_back)),),
        body: switch (asyncValue) {
          AsyncData(:final value) => _buildDataView(value),
          AsyncError(:final error) => _buildErrorView(),
          AsyncLoading() => _buildLoadingView(),
          _ => Container(),
        },
        floatingActionButton: switch (asyncValue) {
          AsyncData(:final value) =>
            value.isEmpty
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      router.push(
                        MaterialEditRoute(
                          onSubmit: (material) {
                            ref.read(provider.notifier).addMaterial(material);
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
          _ => null,
        },
      ),
    );
  }
}

class UsageInputDialog extends StatefulWidget {
  const UsageInputDialog({
    super.key,
    required this.unitType,
    this.controller,
    this.onCancel,
    this.onConfirm,
    this.title,
    this.initUsage,
  });

  /// 计量单位类型
  final UnitType unitType;
  final DialogController<String?>? controller;
  final VoidCallback? onCancel;
  final void Function(String usage)? onConfirm;

  /// 不提供标题默认显示"用量"
  final String? title;
  final String? initUsage;

  @override
  State<UsageInputDialog> createState() => _UsageInputDialogState();
}

class _UsageInputDialogState extends State<UsageInputDialog> {
  final _usageController = TextEditingController();

  String _getSuffixText() {
    return Utils.getMaterialUnitText(widget.unitType);
  }

  @override
  void initState() {
    super.initState();
    if (widget.initUsage != null) {
      _usageController.text = widget.initUsage!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? "用量"),
      content: TextField(
        controller: _usageController,
        decoration: InputDecoration(
          hintText: "请输入用量, 留空默认为0",
          suffix: Text(_getSuffixText()),
        ),
        keyboardType: widget.unitType == UnitType.UINT_TYPE_PER
            ? TextInputType.number
            : TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          // 选择份数时只允许输入整数
          if (widget.unitType == UnitType.UINT_TYPE_PER)
            FilteringTextInputFormatter.digitsOnly, // 只允许输入 0-9
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            debugPrint(
              "路由栈UsageInputDialog(取消): ${router.stack.map((e) => e.name).toList()}",
            );
            widget.controller?.dismiss();
            widget.onCancel?.call();
          },
          child: Text("取消"),
        ),
        TextButton(
          onPressed: () {
            debugPrint(
              "路由栈UsageInputDialog(确定): ${router.stack.map((e) => e.name).toList()}",
            );
            if (_usageController.text.trim().isNotEmpty) {
              try {
                Decimal.parse(_usageController.text.trim());
              } catch (e, stack) {
                Utils.report(e, stack);
                Fluttertoast.showToast(msg: "请输入正确的数字");
                return;
              }
            }
            final usage = Decimal.parse(_usageController.text.trim());
            widget.controller?.setResult(usage.toStringAsFixed(2));
            widget.controller?.dismiss();
            widget.onConfirm?.call(usage.toStringAsFixed(2));
            debugPrint(
              "路由栈UsageInputDialog(post确定): ${router.stack.map((e) => e.name).toList()}",
            );
          },
          child: Text("确定"),
        ),
      ],
    );
  }
}
