import 'package:decimal/decimal.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/utils/data_extends.dart';

/// 购物车
class ShoppingCart {
  List<CartItem> _items = [];
  List<CartItem> get items => List<CartItem>.from(_items);
  set items (List<CartItem> cartItems) {
    _items = List<CartItem>.from(cartItems);
  }
  ShoppingCart();

  factory ShoppingCart.fromCartItems(List<CartItem> cartItems) {
    final cart = ShoppingCart();
    cart.addAll(cartItems);
    return cart;
  }

  void addAll(List<CartItem> cartItems) {
    for (final item in cartItems) {
      addCartItem(item.dish, item.portion);
    }
  }

  void addCartItem(Dish dish, DishPortion portion) {
    // 检查是否已经添加过该商品的同样 portion
    final dishId = dish.id;
    // List<CartItem> sameDishItem = [];
    for (final item in _items) {
      if (item.dish.id == dishId && item.portion.id == portion.id) {
        item.count++;
        return;
      }
    }
    _items.add(CartItem(dish: dish, portion: portion, count: 1));
    // for (final item in _items) {
    //   if (item.dish.id == dishId) {
    //     sameDishItem.add(item);
    //     break;
    //   }
    // }
    // for (final item in sameDishItem) {
    //   if (item.portion.id == portion.id) {
    //     // 仅增加商品数量
    //     item.count++;
    //     return;
    //   }
    // }
  }

  /// 减少购物车中的物品
  void removeCartItem(Dish dish, DishPortion portion) {
    // 检查是否已经添加过该商品的同样 portion
    final dishId = dish.id;
    // List<CartItem> sameDishItem = [];
    int index = 0;
    for (; index < _items.length; index++) {
      final item = _items[index];
      if (item.dish.id == dishId && item.portion.id == portion.id) {
        item.count--;
        if (item.count <= 0) { // 如果数量为 0 或小于0，则直接移除该项
          _items.removeAt(index);
        }
        return;
      }
    }
  }

  bool isInCart(Dish dish, DishPortion portion) {
    for (final i in _items) {
      if (i.dish.id == dish.id && i.portion.id == portion.id) {
        return true;
      }
    }
    return false;
  }

  bool hasPortionInCart(Dish dish) {
    for (final item in _items) {
      if (item.dish.id == dish.id) {
        // 以防万一
        if (item.count > 0) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  int getPortionCountOfDish(Dish dish, DishPortion portion) {
    for (final i in _items) {
      if (i.dish.id == dish.id && i.portion.id == portion.id) {
        return i.count;
      }
    }
    return 0;
  }

  /// 结算总金额
  Decimal getTotalPrice() {
    Decimal total = Decimal.zero;
    for (final item in _items) {
      final count = item.count;
      total += item.portion.price.d() * count.toDecimal();
    }
    return total;
  }

  Decimal getTotalPriceOfDishAndPortion(Dish dish, DishPortion portion) {
    for (final item in _items) {
      if (item.dish.id == dish.id && item.portion.id == portion.id) {
        return item.count.toDecimal() * item.portion.price.d();
      }
    }
    return 0.toDecimal();
  }

  void clear() {
    _items.clear();
  }
}

/// 购物车中的商品信息
class CartItem {
  Dish dish;
  DishPortion portion;
  int count;

  CartItem({
    required this.dish,
    required this.portion,
    required this.count,
  });
}