import 'package:fluttertoast/fluttertoast.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/cost_service.dart';
import 'package:restaurant_management/src/generated/cost_service.pb.dart';
import 'package:restaurant_management/src/generated/types.pbenum.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cost_list_provider.g.dart';

@riverpod
class CostListNotifier extends _$CostListNotifier {
  @override
  FutureOr<List<CostInfo>> build([CostType? costType]) async {
    final req = GetAllCostReq(
      costType: costType ?? CostType.COST_TYPE_UNKNOWN,
    );
    final resp = await CostService.client.getAllCost(req);
    return resp.costInfoList;
  }

  /// 删除并更新
  Future<void> deleteByIds(List<int> ids) async {
    if (ids.isEmpty) {
      return;
    }
    try {
      final req = DeleteCostsReq(
        costIdList: ids
      );
      await CostService.client.deleteCosts(req);
      // 更新本地数据
      ref.invalidateSelf();
      Fluttertoast.showToast(msg: "删除成功");
    } on GrpcError catch(e,s) {
      Utils.report(e,s);
      Fluttertoast.showToast(msg: "删除失败");
    }
  }
}