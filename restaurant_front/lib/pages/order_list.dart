import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_management/main.dart';
import 'package:restaurant_management/providers/order_list_provider.dart';
import 'package:restaurant_management/route/app_router.gr.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

// TODO: 订单筛选
@RoutePage()
class OrderListPage extends ConsumerStatefulWidget {
  const OrderListPage({super.key});

  @override
  ConsumerState<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends ConsumerState<OrderListPage> {
  AutoDisposeAsyncNotifierProvider<OrderListNotifier, List<OrderSimpleInfo>>
  get provider => orderListNotifierProvider;

  Widget _buildListView() {
    final asyncOrderInfoList = ref.watch(provider);
    return asyncOrderInfoList.when(data: (orderInfoList){
      return RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(provider);
        },
        child: ListView.builder(itemCount: orderInfoList.length, itemBuilder: (context, index) {
          final orderSimpleInfo = orderInfoList[index];
          final orderCreatedDateTime = DateTime.fromMillisecondsSinceEpoch(orderSimpleInfo.createdAt.toInt() * 1000); // 后端传来的时间戳是秒数, 需要转换成毫秒数
          final formatter = DateFormat("yyyy年MM月dd日 HH:mm");
          final formattedDateTime = formatter.format(orderCreatedDateTime);
          return ListTile(
            title: Text(formattedDateTime),
            subtitle: Text("￥${orderSimpleInfo.totalPrice}"),
            onTap: () {
              router.push(OrderDetailRoute(orderId: orderSimpleInfo.orderId));
            },
          );
        }),
      );
    }, error: (e, s) {
      Utils.report(e,s);
      return Center(child: Text("加载失败"),);
    }, loading: () => Center(child: CircularProgressIndicator(),));
  }

  @override
  Widget build(BuildContext context) {
    return BackScope(child: Scaffold(
      appBar: AppBar(title: Text("我的订单"),leading: BackButton(),),
      body: _buildListView(),
    ));
  }
}
