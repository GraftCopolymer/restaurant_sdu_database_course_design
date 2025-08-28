import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dish_info_edit_provider.g.dart';

@riverpod
class DishInfoEditModel extends _$DishInfoEditModel {
  @override
  Dish build([Dish? initDish]) {
    if (stateOrNull != null) return state;
    if (initDish != null) {
      return initDish;
    }
    return Dish();
  }

  void addPortion(DishPortion portion) {
    final dish = state.deepCopy();
    dish.portions.add(portion);
    state = dish;
  }

  void updateDishName(String name) {
    state.name = name;
  }

  void updateImageUrl(String imageUrl) {
    state.imageUrl = imageUrl;
  }

  void updatePortion(DishPortion portion, int index) {
    if (index < 0 || index >= state.portions.length) {
      return;
    }
    final dish = state.deepCopy();
    dish.portions[index] = portion;
    state = dish;
  }

  /// 更新指定索引处的portion的recipe属性
  void updateRecipe(Recipe recipe, int index) {
    if (index < 0 || index >= state.portions.length) {
      return;
    }
    final dish = state.deepCopy();
    dish.portions[index].recipe = recipe;
    state = dish;
  }

}