import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/models/shopping_cart.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/providers/shopping_cart_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/src/generated/types.pb.dart' show OrderType;
import 'package:restaurant_management/utils/data_extends.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';
import 'package:restaurant_management/src/generated/common.pb.dart' as pb;
import 'package:fixnum/src/int64.dart';
import 'package:restaurant_management/widgets/global_dialog.dart';
import 'package:restaurant_management/widgets/load_more_widget.dart';
import 'package:restaurant_management/widgets/red_point.dart';

/// 顾客点餐界面
@RoutePage()
class CustomerSelectDishPage extends ConsumerStatefulWidget {
  const CustomerSelectDishPage({super.key, required this.orderType ,this.table});

  /// 订单类型
  final OrderType orderType;
  /// 当订单类型为 DINING_IN 时, 该字段必须传入
  final Table? table;

  @override
  ConsumerState<CustomerSelectDishPage> createState() =>
      _CustomerSelectDishPageState();
}

class _CustomerSelectDishPageState
    extends ConsumerState<CustomerSelectDishPage> {
  /// 菜品分类数据
  late final _dishTypeProvider = FutureProvider((ref) async {
    final resp = await DishService.client.getDishType(Empty());
    // 默认选中第一个
    if (resp.dishTypes.isNotEmpty) {
      setState(() {
        _selectDishType = resp.dishTypes.first;
      });
    }
    return resp.dishTypes;
  });

  late final _dishListProvider =
      AutoDisposeAsyncNotifierProviderFamily<
        _DishListNotifier,
        List<Dish>,
        DishType
      >(_DishListNotifier.new);

  DishType? _selectDishType;

  String _getDishTileTrailingText(Dish dish) {
    if (!_hasPortion(dish)) {
      return "不售卖";
    }
    final portions = dish.portions;
    Decimal minPrice = portions[0].price.d();
    int index = 0;
    for (; index < portions.length; index++) {
      if (minPrice > portions[index].price.d()) {
        minPrice = portions[index].price.d();
      }
    }
    return "￥${minPrice.toStringAsFixed(2)}起";
  }

  bool _hasPortion(Dish dish) {
    final portions = dish.portions;
    if (portions.isEmpty) {
      return false;
    }
    return true;
  }

  Widget _buildDishTileTrailing(Dish dish) {
    if (!_hasPortion(dish)) {
      return SizedBox.shrink();
    } else if (dish.portions.length == 1) {
      final isInCart = ref
          .watch(shoppingCartModelProvider().notifier)
          .isInCart(dish, dish.portions[0]);
      if (isInCart) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                ref
                    .read(shoppingCartModelProvider().notifier)
                    .removeCartItem(dish, dish.portions[0]);
              },
              icon: Icon(Icons.arrow_back_ios, size: 15),
            ),
            Text(
              "${ref.watch(shoppingCartModelProvider().notifier).getCountOf(dish, dish.portions[0])}",
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(shoppingCartModelProvider().notifier)
                    .addCartItem(dish, dish.portions[0]);
              },
              icon: Icon(Icons.arrow_forward_ios, size: 15),
            ),
          ],
        );
      }
      return IconButton(
        onPressed: () {
          ref
              .read(shoppingCartModelProvider().notifier)
              .addCartItem(dish, dish.portions[0]);
        },
        icon: Icon(Icons.add),
      );
    } else {
      // 有多个portion
      return Stack(
        children: [
          TextButton(
            onPressed: () {
              GlobalDialog.showCustom(
                builder: (context, controller) {
                  return _SelectPortionDialog(
                    dish: dish,
                    provider: shoppingCartModelProvider,
                  );
                },
              );
            },
            child: Text("选规格"),
          ),
          if (ref.read(shoppingCartModelProvider()).hasPortionInCart(dish))
            RedPoint(content: ""),
        ],
      );
    }
  }

  String _getTitleText() {
    String baseTitle = "点餐";
    if (widget.table != null && widget.orderType == OrderType.ORDER_TYPE_DINING_IN) {
      baseTitle = "${widget.table!.number}桌 $baseTitle";
    } else if (widget.orderType == OrderType.ORDER_TYPE_TAKE_OUT) {
      baseTitle = "外卖 $baseTitle";
    }
    if (_selectDishType != null) {
      baseTitle = "$baseTitle - ${_selectDishType!.name}";
    }
    return baseTitle;
  }

  @override
  void initState() {
    super.initState();
    assert(widget.orderType != OrderType.ORDER_TYPE_DINING_IN || widget.table != null);
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _getTitleText(),
          ),
          leading: BackButton(),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            debugPrint("约束: " + constraints.toString());
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final asyncDishType = ref.watch(_dishTypeProvider);
                      return asyncDishType.when(
                        data: (typeList) {
                          return SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: typeList.length,
                              itemBuilder: (context, index) {
                                final dishType = typeList[index];
                                return Container(
                                  color:
                                      _selectDishType?.dishTypeID ==
                                          dishType.dishTypeID
                                      ? Colors.grey.withAlpha(100)
                                      : Colors.transparent,
                                  child: SizedBox(
                                    width: 100,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: DishCategoryTab(
                                        title: dishType.name,
                                        onTap: () {
                                          setState(() {
                                            _selectDishType = dishType;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        error: (error, stack) => Container(),
                        loading: () => Container(),
                      );
                    },
                  ),
                  Divider(),
                  Consumer(
                    builder: (context, ref, child) {
                      if (_selectDishType == null) return Container();
                      final asyncDishList = ref.watch(
                        _dishListProvider(_selectDishType!),
                      );
                      return Expanded(
                        child: asyncDishList.when(
                          data: (dishList) {
                            return SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: dishList.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == dishList.length) {
                                    final isFinished = ref
                                        .watch(
                                          _dishListProvider(
                                            _selectDishType!,
                                          ).notifier,
                                        )
                                        .isFinished();
                                    return NotificationListener<
                                      LoadMoreNotification
                                    >(
                                      onNotification: (notification) {
                                        if (isFinished != null && !isFinished) {
                                          ref
                                              .read(
                                                _dishListProvider(
                                                  _selectDishType!,
                                                ).notifier,
                                              )
                                              .loadMore();
                                        }
                                        return false;
                                      },
                                      child: LoadMoreWidget(
                                        isFinished: isFinished,
                                      ),
                                    );
                                  }
                                  final dish = dishList[index];
                                  return ListTile(
                                    enabled: _hasPortion(dish),
                                    onTap: _hasPortion(dish)
                                        ? () {
                                            if (dish.portions.length > 1) {
                                              // 打开选规格对话框
                                              GlobalDialog.showCustom(
                                                builder: (context, controller) {
                                                  return _SelectPortionDialog(
                                                    dish: dish,
                                                    provider:
                                                        shoppingCartModelProvider,
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        : null,
                                    subtitle: Text(
                                      _getDishTileTrailingText(dish),
                                    ),
                                    trailing: _buildDishTileTrailing(dish),
                                    title: Text(dish.name),
                                  );
                                },
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            Utils.report(error, stackTrace);
                            return Center(child: Text("加载失败"));
                          },
                          loading: () {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        extendBody: false,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, -9),
                    color: Colors.grey.withAlpha(100),
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  // 弹出购物车bottom sheet
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return _ShoppingCartBottomSheet(
                        provider: shoppingCartModelProvider,
                      );
                    },
                  );
                },
                trailing: FilledButton(onPressed: () {
                  if (widget.orderType == OrderType.ORDER_TYPE_DINING_IN) {
                    router.push(PlaceOrderRoute(orderType: widget.orderType, provider: shoppingCartModelProvider(), table: widget.table));
                  } else if (widget.orderType == OrderType.ORDER_TYPE_TAKE_OUT) {
                    router.push(PlaceOrderRoute(orderType: widget.orderType, provider: shoppingCartModelProvider()));
                  } else {
                    Fluttertoast.showToast(msg: "订单错误!");
                  }
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("下单"),
                    Icon(Icons.local_fire_department)
                  ],
                )),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [Icon(Icons.shopping_cart_outlined), Text("购物车")],
                  ),
                ),
                subtitle: Text(
                  "总价: ￥${ref.watch(shoppingCartModelProvider()).getTotalPrice()}",
                ),
              ),
            ),
            // 防止底部小白条遮挡
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }
}

class _DishListNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Dish>, DishType> {
  final pb.PageInfo _pageInfo = pb.PageInfo(page: 1, pageSize: 10);

  late final DishType _dishType;

  List<int> _loadingPages = [];

  @override
  Future<List<Dish>> build(DishType dishType) async {
    _dishType = dishType;
    final req = GetDishesWithCategoryReq(
      pageInfo: _pageInfo,
      category: dishType,
    );
    final resp = await DishService.client.getDishesWithCategory(req);
    _updatePageInfo(resp.pageInfo);
    for (final dish in resp.dishes) {
      debugPrint("测试: Dish: ${dish.name}");
      for (final p in dish.portions) {
        debugPrint("测试Portion: ${p.name} - ${p.price}");
      }
    }
    return resp.dishes;
  }

  void _updatePageInfo(pb.PageInfo pageInfo) {
    _pageInfo
      ..page = pageInfo.page
      ..pageSize = pageInfo.pageSize
      ..total = pageInfo.total;
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null) {
      return;
    }
    final toLoadPageNumber = _pageInfo.page + 1;
    if (_loadingPages.contains(toLoadPageNumber)) {
      return;
    }
    _loadingPages.add(toLoadPageNumber);
    try {
      final req = GetDishesWithCategoryReq(
        pageInfo: pb.PageInfo(
          page: toLoadPageNumber,
          pageSize: _pageInfo.pageSize,
        ),
        category: _dishType,
      );
      final resp = await DishService.client.getDishesWithCategory(req);
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
}

class DishCategoryTab extends StatelessWidget {
  const DishCategoryTab({super.key, required this.title, this.onTap});

  final String title;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          debugPrint("1约束: $constraints");
          return Container(
            color: Colors.transparent,
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(title, overflow: TextOverflow.ellipsis, maxLines: 3),
          );
        },
      ),
    );
  }
}

/// 规格选择对话框
class _SelectPortionDialog extends ConsumerStatefulWidget {
  const _SelectPortionDialog({
    super.key,
    required this.dish,
    required this.provider,
    this.controller,
  });

  final ShoppingCartModelFamily provider;

  final DialogController? controller;
  final Dish dish;

  @override
  ConsumerState<_SelectPortionDialog> createState() =>
      __SelectPortionDialogState();
}

class __SelectPortionDialogState extends ConsumerState<_SelectPortionDialog> {
  DishPortion? _selectedPortion;

  List<Widget> _buildWrapChildren() {
    final portions = widget.dish.portions;
    final List<Widget> ret = [];
    for (final por in portions) {
      ret.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedPortion = por;
            });
          },
          child: Stack(
            children: [
              Chip(
                backgroundColor: _selectedPortion?.id == por.id
                    ? Theme.of(context).colorScheme.surfaceDim
                    : null,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(por.name), Text(" ￥${por.price}")],
                ),
              ),
              if (ref
                      .read(widget.provider())
                      .getPortionCountOfDish(widget.dish, por) >
                  0)
                RedPoint(
                  content:
                      "${ref.read(widget.provider()).getPortionCountOfDish(widget.dish, por)}",
                ),
            ],
          ),
        ),
      );
    }
    return ret;
  }

  Widget? _buildBottomActionTrailing() {
    if (_selectedPortion == null) {
      return null;
    }
    final isInCart = ref
        .watch(widget.provider())
        .isInCart(widget.dish, _selectedPortion!);
    if (isInCart) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ref
                  .read(widget.provider().notifier)
                  .removeCartItem(widget.dish, _selectedPortion!);
              // setState(() {});
            },
            icon: Icon(Icons.arrow_back_ios, size: 15),
          ),
          Text(
            "${ref.watch(widget.provider().notifier).getCountOf(widget.dish, _selectedPortion!)}",
          ),
          IconButton(
            onPressed: () {
              ref
                  .read(widget.provider().notifier)
                  .addCartItem(widget.dish, _selectedPortion!);
              // setState(() {});
            },
            icon: Icon(Icons.arrow_forward_ios, size: 15),
          ),
        ],
      );
    } else {
      return FilledButton(
        onPressed: _selectedPortion == null
            ? null
            : () {
                ref
                    .read(widget.provider().notifier)
                    .addCartItem(widget.dish, _selectedPortion!);
                // setState(() {});
              },
        child: Text("加入购物车"),
      );
    }
  }

  Widget _buildBottomAction() {
    return ListTile(
      title: Text(
        _selectedPortion == null ? "---" : "￥${_selectedPortion!.price}",
      ),
      trailing: _buildBottomActionTrailing(),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.dish.portions.length > 1);
    return AlertDialog(
      title: Text("选择规格"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(spacing: 5, runSpacing: 5, children: _buildWrapChildren()),
          _buildBottomAction(),
        ],
      ),
    );
  }
}

class _ShoppingCartBottomSheet extends ConsumerStatefulWidget {
  const _ShoppingCartBottomSheet({super.key, required this.provider});

  final ShoppingCartModelFamily provider;

  @override
  ConsumerState<_ShoppingCartBottomSheet> createState() =>
      __ShoppingCartBottomSheetState();
}

class __ShoppingCartBottomSheetState
    extends ConsumerState<_ShoppingCartBottomSheet> {
  // 排序, 将相同Dish的portion排在一起，同一dish内的portion按照portionId排序
  List<CartItem> _getSortedCartItemList() {
    final cartItems = ref.watch(widget.provider()).items;
    final Map<Dish, List<CartItem>> dishCartItemMap = {};
    // 统计当前购物车中的所有Dish
    final List<Dish> allDish = [];
    for (final dish in cartItems.map((e) => e.dish)) {
      // 检查当前dish是否已经在allDish中，采用id检查
      for (final d in allDish) {
        if (d.id == dish.id) {
          continue;
        }
      }
      allDish.add(dish);
    }
    // 按照id升序
    allDish.sort((a, b) => a.id - b.id);
    for (final dish in allDish) {
      dishCartItemMap.addEntries([MapEntry(dish, [])]);
    }
    for (final item in cartItems) {
      dishCartItemMap[item.dish]!.add(item);
    }
    // 对Map的每个数组都排序, 并汇总最后结果
    final List<CartItem> ret = [];
    dishCartItemMap.forEach((k, v) {
      v.sort((a, b) => a.portion.id - b.portion.id);
      ret.addAll(v);
    });
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final cartItemList = _getSortedCartItemList();
    // 屏幕高度
    final screenHeight = MediaQuery.of(context).size.height;
    if (cartItemList.isEmpty) {
      return Center(child: Text("您还未选购商品哦, 快去看看吧~"),);
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItemList.length,
            itemBuilder: (context, index) {
              final cartItem = cartItemList[index];
              return ListTile(
                title: Text(cartItem.dish.name),
                subtitle: Text(cartItem.portion.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "￥${ref.read(widget.provider()).getTotalPriceOfDishAndPortion(cartItem.dish, cartItem.portion)}",
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(shoppingCartModelProvider().notifier)
                            .removeCartItem(cartItem.dish, cartItem.portion);
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 15),
                    ),
                    Text(
                      "${ref.watch(shoppingCartModelProvider().notifier).getCountOf(cartItem.dish, cartItem.portion)}",
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(shoppingCartModelProvider().notifier)
                            .addCartItem(cartItem.dish, cartItem.portion);
                      },
                      icon: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: constraints.maxWidth,
                child: FilledButton(onPressed: () {}, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("下单"),
                    Icon(Icons.local_fire_department),
                    Text("￥${ref.read(widget.provider()).getTotalPrice()}")
                  ],
                )),
              ),
            );
          },
        ),
        SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}
