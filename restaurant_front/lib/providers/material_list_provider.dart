import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/dish_service.dart';
import 'package:restaurant_management/src/generated/common.pb.dart';
import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:restaurant_management/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_list_provider.g.dart';

@riverpod
class MaterialListModel extends _$MaterialListModel {
  List<Material> _materials = [];
  final PageInfo _pageInfo = PageInfo(page: 1, pageSize: 15);

  List<int> _loadingPage = [];

  @override
  FutureOr<List<Material>> build() async {
    final pageInfo = PageInfo(page: 1, pageSize: 15);
    final req = GetMaterialsReq(keywords: "", pageInfo: pageInfo);
    _loadingPage.add(pageInfo.page);
    final resp = await DishService.client.getMaterials(req);
    _updatePageInfo(resp.pageInfo);
    _materials.clear();
    _materials.addAll(resp.materialList);
    _loadingPage.remove(pageInfo.page);
    return List.from(_materials);
  }

  void _updatePageInfo(PageInfo pageInfo) {
    _pageInfo
      ..page = pageInfo.page
      ..pageSize = pageInfo.pageSize
      ..total = pageInfo.total;
  }

  void updateMaterial(Material material, int index) {
    final materials = state.valueOrNull;
    if (materials == null) return;
    final newList = List<Material>.from(materials);
    newList[index] = material;
    state = AsyncValue.data(newList);
  }

  void updateMaterials(List<Material> materialList) {
    final materials = state.valueOrNull;
    if (materials == null) return;
    final newList = List<Material>.from(materials);
    newList.addAll(materialList);
    state = AsyncValue.data(newList);
  }

  void addMaterial(Material material) {
    final materials = state.valueOrNull;
    if (materials == null) return;
    final newList = List<Material>.from(materials);
    newList.add(material);
    state = AsyncValue.data(newList);
  }

  Future<void> loadMore() async {
    final pageToReq = _pageInfo.page + 1;
    if (_loadingPage.contains(pageToReq)) {
      return;
    }
    _loadingPage.add(pageToReq);
    try {
      final req = GetMaterialsReq(
        keywords: "",
        pageInfo: PageInfo(page: _pageInfo.page + 1, pageSize: _pageInfo.pageSize),
      );
      final resp = await DishService.client.getMaterials(req);
      _updatePageInfo(resp.pageInfo);
      updateMaterials(resp.materialList);
    } on GrpcError catch(e, stack) {
      Utils.report(e, stack);
    } finally {
      _loadingPage.remove(pageToReq);
    }
  }
}
