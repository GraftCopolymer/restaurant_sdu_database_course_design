import 'package:restaurant_management/models/shopping_cart.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_cart_provider.g.dart';

@riverpod
class ShoppingCartModel extends _$ShoppingCartModel {
  @override
  ShoppingCart build([List<CartItem>? initItems]) {
    if (initItems != null) {
      return ShoppingCart.fromCartItems(initItems);
    }
    return ShoppingCart();
  }

  /// 判断指定商品的指定份量是否在购物车中
  bool isInCart(Dish dish, DishPortion portion) {
    for (final i in state.items) {
      if (i.dish.id == dish.id && i.portion.id == portion.id) {
        return true;
      }
    }
    return false;
  }

  int getCountOf(Dish dish, DishPortion portion) {
    for (final i in state.items) {
      if (i.dish.id == dish.id && i.portion.id == portion.id) {
        return i.count;
      }
    }
    return 0;
  }

  /// 向购物车添加物品
  void addCartItem(Dish dish, DishPortion portion) {
    state.addCartItem(dish, portion);
    state = ShoppingCart()..items = state.items; // 通知外界变化
  }

  void removeCartItem(Dish dish, DishPortion portion) {
    state.removeCartItem(dish, portion);
    state = ShoppingCart()..items = state.items; // 通知外界变化
  }
}