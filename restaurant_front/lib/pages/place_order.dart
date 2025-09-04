import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/providers/shopping_cart_provider.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/restaurantV2/types.pbenum.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart' show Table;
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';

@RoutePage()
class PlaceOrderPage extends ConsumerStatefulWidget {
  const PlaceOrderPage({super.key, required this.orderType, required this.provider, this.table});

  final OrderType orderType;
  final Table? table;
  final ShoppingCartModelProvider provider;

  @override
  ConsumerState<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends ConsumerState<PlaceOrderPage> {
  ShoppingCartModelProvider get provider => widget.provider;

  Widget _buildDishesColumn() {
    final List<Widget> dishWidgets = [];
    for (final cartItem in ref.watch(provider).items) {
      dishWidgets.add(
        ListTile(
          title: Text(cartItem.dish.name),
          subtitle: Text(cartItem.portion.name),
          leadingAndTrailingTextStyle: TextStyle(fontSize: 15, color: Colors.black),
          trailing: Text("x${cartItem.count}  ￥${ref.watch(provider).getTotalPriceOfDishAndPortion(cartItem.dish, cartItem.portion)}"),
        )
      );
    }
    // 显示总价的组件
    dishWidgets.add(
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width: 16,),
          Text("总价: ", style: TextStyle(fontSize: 20),),
          Text("￥${ref.watch(provider).getTotalPrice()}", style: TextStyle(fontSize: 24),),
        ],
      )
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: dishWidgets,
    );
  }

  /// 堂食订单
  Widget _buildDiningInBody() {
    return LayoutBuilder(
      builder:(context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题
                  Text("桌号: ${widget.table!.number} 堂食订单", style: Theme.of(context).textTheme.headlineLarge,),
                  Divider(indent: 10, endIndent: 10,),
                  // 菜品列表
                  _buildDishesColumn(),
                  // 下单按钮
                  Align(alignment: Alignment.centerRight, child: FilledButton(onPressed: () async {
                    // TODO: 下单
                    // 将购物车数据传给后端让后端计算加个, 防止被篡改
                    // 检查购物车是否为空
                    if (ref.read(provider).items.isEmpty) {
                      Fluttertoast.showToast(msg: "下单失败: 购物车为空!");
                      return;
                    }
                    final controller = GlobalDialog.showCustom<DialogResult>(builder: (context, controller) {
                      return ConfirmPayDialog(
                        totalPrice: ref.read(provider).getTotalPrice(),
                        onConfirm: () {
                          controller.setResult(DialogResult.confirm);
                          controller.dismiss();
                        },
                        onCancel: () {
                          controller.setResult(DialogResult.cancel);
                          controller.dismiss();
                        },
                      );
                    });
                    final result = await controller?.getResult();
                    if (result != DialogResult.confirm) {
                      return;
                    }
                    // 上传订单
                    try {
                      final req = PlaceOrderReq(
                        orderType: widget.orderType,
                        address: null, // TODO: 外卖地址
                        table: widget.table,
                        orderItems: ref.read(provider).items.map<OrderItem>((e) {
                          final orderItem = OrderItem(
                            dishId: e.dish.id,
                            portionId: e.portion.id,
                            count: e.count
                          );
                          return orderItem;
                        })
                      );
                      await DishService.client.placeOrder(req);
                      Fluttertoast.showToast(msg: "下单成功");
                      // TODO: 当前页面替换为订单详情页
                      
                    } on GrpcError catch(e,s) {
                      Utils.report(e,s);
                      Fluttertoast.showToast(msg: "支付失败: ${e.message}");
                    }
                  }, child: Text("支付")))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 外卖订单
  Widget _BuildTakeoutBody() {
    return Placeholder();
  }

  Widget _buildErrorView() {
    return Center(child: Text("订单错误"),);
  }

  Widget _buildBody() {
    switch (widget.orderType) {
      case OrderType.ORDER_TYPE_DINING_IN:
        return _buildDiningInBody();
      case OrderType.ORDER_TYPE_TAKE_OUT:
        return _BuildTakeoutBody();
      default:
        return _buildErrorView();
    }
  }

  @override
  void initState() {
    super.initState();
    assert(widget.orderType != OrderType.ORDER_TYPE_DINING_IN || widget.table != null);
  }
  
  @override
  Widget build(BuildContext context) {
    return BackScope(child: Scaffold(
      appBar: AppBar(title: Text("下单"), leading: BackButton(),),
      body: _buildBody(),
    ));
  }
}

/// 确认支付对话框
class ConfirmPayDialog extends StatelessWidget {
  const ConfirmPayDialog({super.key, this.onConfirm, this.onCancel, required this.totalPrice});

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Decimal totalPrice;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("确认支付"),
      content: Text("支付: ${totalPrice.toStringAsFixed(2)} 元"),
      actions: [
        TextButton(onPressed: (){
          onCancel?.call();
        }, child: Text("取消")),
        TextButton(onPressed: (){
          onConfirm?.call();
        }, child: Text("确定")),
      ],
    );
  }
}