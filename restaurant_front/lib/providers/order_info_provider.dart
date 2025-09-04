import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_info_provider.g.dart';

@riverpod
class OrderInfoNotifier extends _$OrderInfoNotifier {
  @override
  Future<OrderInfo> build(int orderId) async {
    final req = GetOrderInfoReq(
      orderId: orderId,
    );
    final resp = await DishService.client.getOrderInfo(req);
    return resp.orderInfo;
  }
}