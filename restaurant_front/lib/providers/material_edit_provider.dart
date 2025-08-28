import 'package:restaurant_management/src/generated/dish_service.pb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_edit_provider.g.dart';

@riverpod
class MaterialEdit extends _$MaterialEdit {
  @override
  Material build([Material? initMaterial]) {
    if (initMaterial != null) {
      return initMaterial;
    } else {
      return Material();
    }
  }

  void updateMaterial(Material material) {
    // 如果有id, 则不更新id
    final currentStateHasId = state.hasId();
    final _material = Material(
      name: material.name,
      unitType: material.unitType,
      amount: material.amount,
      price: material.price,
    );
    if (!currentStateHasId) {
      _material.id = state.id;
    }
    state = _material;
  }
}