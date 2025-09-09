import 'package:restaurant_management/network/cost_service.dart';
import 'package:restaurant_management/src/generated/cost_service.pb.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cost_chart_data_provider.g.dart';

@riverpod
class CostChartDataNotifier extends _$CostChartDataNotifier {
  @override
  FutureOr<CostChartData> build() async {
    final resp = await CostService.client.getCostChartData(Empty());
    return resp.costChartData;
  }
}