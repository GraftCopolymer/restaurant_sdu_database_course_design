import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/src/generated/google/protobuf/empty.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'table_list_provider.g.dart';

@riverpod
class TableListNotifier extends _$TableListNotifier {
  @override
  FutureOr<List<Table>> build() async {
    final resp = await DishService.client.getAllTables(Empty());
    return resp.tables;
  }

  // 删除餐桌
  Future<void> deleteTable(int index) async {
    final tableList = state.valueOrNull;
    if (tableList == null) {
      return;
    }
    try {
      final req = DeleteTableReq(
        tableId: tableList[index].id
      );
      await DishService.client.deleteTable(req);
      // 刷新
      ref.invalidateSelf();
    } on GrpcError catch(e, s) {
      Utils.report(e, s);
    }
  }
}