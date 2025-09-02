import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/widgets/back_scope.dart';

@RoutePage()
class PlaceOrderPage extends ConsumerStatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  ConsumerState<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends ConsumerState<PlaceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return BackScope(child: Scaffold(
      appBar: AppBar(title: Text("下单"), leading: BackButton(),),
      body: Placeholder(),
    ));
  }
}