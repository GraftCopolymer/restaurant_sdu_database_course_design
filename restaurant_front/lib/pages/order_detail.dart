import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/providers/order_info_provider.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/restaurantV2/types.pb.dart';
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

@RoutePage()
class OrderDetailPage extends ConsumerStatefulWidget {
  const OrderDetailPage({super.key, required this.orderId});

  final int orderId;

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  OrderInfoNotifierProvider get provider =>
      OrderInfoNotifierProvider(widget.orderId);

  String _getTotalPriceString(OrderInfo orderInfo) {
    var totalPrice = Decimal.fromInt(0);
    for (final item in orderInfo.orderInfoItems) {
      totalPrice += item.portion.price.d() * item.count.toDecimal();
    }
    return totalPrice.toStringAsFixed(2);
  }

  String _getPayDateTimeString(OrderInfo orderInfo) {
    final formatter = DateFormat('yyyy年MM月dd日 HH:mm');
    final dateTime = DateTime.fromMillisecondsSinceEpoch(orderInfo.createdAt.toInt() * 1000);
    return formatter.format(dateTime);
  }

  Widget _buildTitle() {
    final asyncOrderInfo = ref.watch(provider);
    return asyncOrderInfo.when(
      data: (orderInfo) {
        switch (orderInfo.orderType) {
          case OrderType.ORDER_TYPE_DINING_IN:
            return Text("堂食订单 桌号: ${orderInfo.table.number}", style: Theme.of(context).textTheme.titleLarge,);
          case OrderType.ORDER_TYPE_TAKE_OUT:
            return Text("外卖订单", style: Theme.of(context).textTheme.titleLarge);
          default:
            return Text("未知订单", style: Theme.of(context).textTheme.titleLarge);
        }
      },
      error: (e, s) {
        Utils.report(e, s);
        return Text("无法获取订单信息");
      },
      loading: () => Container(),
    );
  }

  Widget _buildOrderDetailBody() {
    final asyncOrderInfo = ref.watch(provider);
    return asyncOrderInfo.when(data: (orderInfo){
      final columnChildren = <Widget>[];
      for (final orderItem in orderInfo.orderInfoItems) {
        columnChildren.add(
          ListTile(
            title: Text(orderItem.dish.name),
            subtitle: Text("${orderItem.count}份 ${orderItem.portion.name}"),
            trailing: Text("￥${orderItem.portion.price.d() * orderItem.count.toDecimal()}"),
          )
        );
      }
      columnChildren.add(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("支付金额: ${_getTotalPriceString(orderInfo)}元", style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("支付时间: ${_getPayDateTimeString(orderInfo)}", style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ],
        )
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: columnChildren,
      );
    }, error: (e,s) {
      Utils.report(e,s);
      return Center(child: Text("${e is GrpcError ? e.message : '加载错误'}"),);
    }, loading: () => Center(child: CircularProgressIndicator(),));
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(title: Text("订单详情"), leading: BackButton()),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildTitle(), _buildOrderDetailBody()],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
