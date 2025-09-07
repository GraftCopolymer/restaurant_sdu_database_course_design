import 'package:restaurant_management/network/cost_service.dart';
import 'package:restaurant_management/src/generated/cost_service.pb.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cost_list_provider.g.dart';

@riverpod
class CostListNotifier extends _$CostListNotifier {
  @override
  FutureOr<List<CostInfo>> build() async {
    final resp = await CostService.client.getAllCost(Empty());
    return resp.costInfoList;
  }
}