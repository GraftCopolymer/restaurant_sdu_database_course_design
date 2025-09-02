import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/common.pb.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fixnum/fixnum.dart';
part 'dish_list_provider.g.dart';

@riverpod
class DishListModel extends _$DishListModel {
  final _pageInfo = PageInfo(page: 1, pageSize: 10);

  List<int> _loadingPages = [];

  @override
  FutureOr<List<Dish>> build() async {
    final req = GetDishesReq(pageInfo: _pageInfo, keywords: "");
    final resp = await DishService.client.getDishes(req);
    _updatePageInfo(resp.pageInfo);
    return resp.dishes;
  }

  void _updatePageInfo(PageInfo pageInfo) {
    _pageInfo
      ..page = pageInfo.page
      ..pageSize = pageInfo.pageSize;

    /// 防止本地编辑了列表, 后台的列表数量还没更新导致状态错误
    if (pageInfo.total > _pageInfo.total) {
      _pageInfo.total = pageInfo.total;
    }
  }

  void addDish(Dish dish) {
    ref.invalidateSelf();
    _pageInfo
      ..page = 1
      ..pageSize = 10
      ..total = Int64(0);
    // final currentDishes = state.valueOrNull;
    // if (currentDishes == null) return;
    // _pageInfo.total++;
    // state = AsyncValue.data([dish, ...currentDishes]);
  }

  void updateDish(Dish dish) {
    final currentDishes = state.valueOrNull;
    if (currentDishes == null) return;
    state = AsyncValue.data(
      currentDishes.map((d) => d.id == dish.id ? dish : d).toList(),
    );
  }

  Future<void> loadMore() async {
    if (state.valueOrNull == null) {
      return;
    }
    final toLoadPageNumber = _pageInfo.page + 1;
    if (_loadingPages.contains(toLoadPageNumber)) {
      // 该页码正在加载中
      return;
    }
    _loadingPages.add(toLoadPageNumber);
    try {
      final req = GetDishesReq(
        pageInfo: PageInfo(
          page: toLoadPageNumber,
          pageSize: _pageInfo.pageSize,
        ),
        keywords: "",
      );
      final resp = await DishService.client.getDishes(req);
      _updatePageInfo(resp.pageInfo);
      state = AsyncData([...state.value!, ...resp.dishes]);
    } on GrpcError catch (e, stack) {
      Utils.report(e, stack);
      state = AsyncError(e, stack);
    } finally {
      _loadingPages.remove(toLoadPageNumber);
    }
  }

  bool? isFinished() {
    final current = state.valueOrNull;
    if (current == null) return null;
    return current.length >= _pageInfo.total.toInt();
  }

  /// 删除指定的所以索引的菜品
  Future<void> deleteIndexesOf(List<int> indexes) async {
    final currentDishes = state.valueOrNull;
    if (currentDishes == null) return;
    final List<Dish> toDelete = [];
    for (final index in indexes) {
      toDelete.add(currentDishes[index]);
    }
    final req = DeleteDishesReq(
      dishIds: toDelete.map((e) => e.id)
    );
    try {
      final resp = await DishService.client.deleteDishes(req);
      // 刷新页面
      _refreshSelf();
    } on GrpcError catch(e, stack) {
      Utils.report(e, stack);
    }
  }

  void _refreshSelf() {
    _pageInfo
      ..page = 1
      ..pageSize = 10
      ..total = Int64(0);
    _loadingPages.clear();
    ref.invalidateSelf();
  }
}
