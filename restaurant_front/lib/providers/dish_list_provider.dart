import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/common.pb.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dish_list_provider.g.dart';

@riverpod
class DishListModel extends _$DishListModel {
  final _pageInfo = PageInfo(page: 1, pageSize: 10);

  @override
  FutureOr<List<Dish>> build() async {
    final req = GetDishesReq(
      pageInfo: _pageInfo,
      keywords: ""
    );
    final resp = await DishService.client.getDishes(req);
    _updatePageInfo(resp.pageInfo);
    return resp.dishes;
  }

  void _updatePageInfo(PageInfo pageInfo) {
    _pageInfo
      ..page = pageInfo.page
      ..pageSize = pageInfo.pageSize
      ..total = pageInfo.total;
  }

  void addDish(Dish dish) {
    final currentDishes = state.valueOrNull;
    if (currentDishes == null) return;
    state = AsyncValue.data([dish, ...currentDishes]);
  }

  void updateDish(Dish dish) {
    final currentDishes = state.valueOrNull;
    if (currentDishes == null) return;
    state = AsyncValue.data(
      currentDishes.map((d) => d.id == dish.id ? dish : d).toList(),
    );
  }
}