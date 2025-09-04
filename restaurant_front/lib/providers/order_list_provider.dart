import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_list_provider.g.dart';

@riverpod
class OrderListNotifier extends _$OrderListNotifier {
  @override
  Future<List<OrderSimpleInfo>> build() async {
    final resp = await DishService.client.getAllOrders(Empty());
    return resp.orderInfoList;
  }
}