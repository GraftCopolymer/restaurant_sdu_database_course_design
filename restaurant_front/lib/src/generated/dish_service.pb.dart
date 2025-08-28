// This is a generated file - do not edit.
//
// Generated from dish_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $2;
import 'restaurantV2/types.pbenum.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Dish extends $pb.GeneratedMessage {
  factory Dish({
    $core.int? id,
    $core.String? name,
    $core.String? imageUrl,
    DishType? dishType,
    $core.Iterable<DishPortion>? portions,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (dishType != null) result.dishType = dishType;
    if (portions != null) result.portions.addAll(portions);
    return result;
  }

  Dish._();

  factory Dish.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Dish.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Dish',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl', protoName: 'imageUrl')
    ..aOM<DishType>(4, _omitFieldNames ? '' : 'dishType',
        protoName: 'dishType', subBuilder: DishType.create)
    ..pc<DishPortion>(5, _omitFieldNames ? '' : 'portions', $pb.PbFieldType.PM,
        subBuilder: DishPortion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Dish clone() => Dish()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Dish copyWith(void Function(Dish) updates) =>
      super.copyWith((message) => updates(message as Dish)) as Dish;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Dish create() => Dish._();
  @$core.override
  Dish createEmptyInstance() => create();
  static $pb.PbList<Dish> createRepeated() => $pb.PbList<Dish>();
  @$core.pragma('dart2js:noInline')
  static Dish getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dish>(create);
  static Dish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  DishType get dishType => $_getN(3);
  @$pb.TagNumber(4)
  set dishType(DishType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDishType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDishType() => $_clearField(4);
  @$pb.TagNumber(4)
  DishType ensureDishType() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<DishPortion> get portions => $_getList(4);
}

class DishPortion extends $pb.GeneratedMessage {
  factory DishPortion({
    $core.int? id,
    $core.String? name,
    $core.String? price,
    $3.DishPortion? portionType,
    Recipe? recipe,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (price != null) result.price = price;
    if (portionType != null) result.portionType = portionType;
    if (recipe != null) result.recipe = recipe;
    return result;
  }

  DishPortion._();

  factory DishPortion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DishPortion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DishPortion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'price')
    ..e<$3.DishPortion>(
        4, _omitFieldNames ? '' : 'portionType', $pb.PbFieldType.OE,
        protoName: 'portionType',
        defaultOrMaker: $3.DishPortion.DISH_PORTION_UNKNOWN,
        valueOf: $3.DishPortion.valueOf,
        enumValues: $3.DishPortion.values)
    ..aOM<Recipe>(5, _omitFieldNames ? '' : 'recipe', subBuilder: Recipe.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishPortion clone() => DishPortion()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishPortion copyWith(void Function(DishPortion) updates) =>
      super.copyWith((message) => updates(message as DishPortion))
          as DishPortion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DishPortion create() => DishPortion._();
  @$core.override
  DishPortion createEmptyInstance() => create();
  static $pb.PbList<DishPortion> createRepeated() => $pb.PbList<DishPortion>();
  @$core.pragma('dart2js:noInline')
  static DishPortion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DishPortion>(create);
  static DishPortion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $3.DishPortion get portionType => $_getN(3);
  @$pb.TagNumber(4)
  set portionType($3.DishPortion value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPortionType() => $_has(3);
  @$pb.TagNumber(4)
  void clearPortionType() => $_clearField(4);

  @$pb.TagNumber(5)
  Recipe get recipe => $_getN(4);
  @$pb.TagNumber(5)
  set recipe(Recipe value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRecipe() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecipe() => $_clearField(5);
  @$pb.TagNumber(5)
  Recipe ensureRecipe() => $_ensure(4);
}

class Recipe extends $pb.GeneratedMessage {
  factory Recipe({
    $core.int? id,
    $core.Iterable<RecipeMaterial>? materials,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (materials != null) result.materials.addAll(materials);
    return result;
  }

  Recipe._();

  factory Recipe.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Recipe.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Recipe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..pc<RecipeMaterial>(
        2, _omitFieldNames ? '' : 'materials', $pb.PbFieldType.PM,
        subBuilder: RecipeMaterial.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Recipe clone() => Recipe()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Recipe copyWith(void Function(Recipe) updates) =>
      super.copyWith((message) => updates(message as Recipe)) as Recipe;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Recipe create() => Recipe._();
  @$core.override
  Recipe createEmptyInstance() => create();
  static $pb.PbList<Recipe> createRepeated() => $pb.PbList<Recipe>();
  @$core.pragma('dart2js:noInline')
  static Recipe getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recipe>(create);
  static Recipe? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RecipeMaterial> get materials => $_getList(1);
}

class RecipeMaterial extends $pb.GeneratedMessage {
  factory RecipeMaterial({
    $core.int? id,
    Material? material,
    $core.String? quantity,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (material != null) result.material = material;
    if (quantity != null) result.quantity = quantity;
    return result;
  }

  RecipeMaterial._();

  factory RecipeMaterial.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecipeMaterial.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecipeMaterial',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<Material>(2, _omitFieldNames ? '' : 'material',
        subBuilder: Material.create)
    ..aOS(3, _omitFieldNames ? '' : 'quantity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecipeMaterial clone() => RecipeMaterial()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecipeMaterial copyWith(void Function(RecipeMaterial) updates) =>
      super.copyWith((message) => updates(message as RecipeMaterial))
          as RecipeMaterial;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecipeMaterial create() => RecipeMaterial._();
  @$core.override
  RecipeMaterial createEmptyInstance() => create();
  static $pb.PbList<RecipeMaterial> createRepeated() =>
      $pb.PbList<RecipeMaterial>();
  @$core.pragma('dart2js:noInline')
  static RecipeMaterial getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecipeMaterial>(create);
  static RecipeMaterial? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  Material get material => $_getN(1);
  @$pb.TagNumber(2)
  set material(Material value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMaterial() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaterial() => $_clearField(2);
  @$pb.TagNumber(2)
  Material ensureMaterial() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get quantity => $_getSZ(2);
  @$pb.TagNumber(3)
  set quantity($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantity() => $_clearField(3);
}

class Material extends $pb.GeneratedMessage {
  factory Material({
    $core.int? id,
    $core.String? name,
    $core.String? price,
    $3.UnitType? unitType,
    $core.String? amount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (price != null) result.price = price;
    if (unitType != null) result.unitType = unitType;
    if (amount != null) result.amount = amount;
    return result;
  }

  Material._();

  factory Material.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Material.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Material',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'price')
    ..e<$3.UnitType>(4, _omitFieldNames ? '' : 'unitType', $pb.PbFieldType.OE,
        protoName: 'unitType',
        defaultOrMaker: $3.UnitType.UINT_TYPE_UNKNOWN,
        valueOf: $3.UnitType.valueOf,
        enumValues: $3.UnitType.values)
    ..aOS(5, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Material clone() => Material()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Material copyWith(void Function(Material) updates) =>
      super.copyWith((message) => updates(message as Material)) as Material;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Material create() => Material._();
  @$core.override
  Material createEmptyInstance() => create();
  static $pb.PbList<Material> createRepeated() => $pb.PbList<Material>();
  @$core.pragma('dart2js:noInline')
  static Material getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Material>(create);
  static Material? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $3.UnitType get unitType => $_getN(3);
  @$pb.TagNumber(4)
  set unitType($3.UnitType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUnitType() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnitType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get amount => $_getSZ(4);
  @$pb.TagNumber(5)
  set amount($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);
}

class GetDishesReq extends $pb.GeneratedMessage {
  factory GetDishesReq({
    $2.PageInfo? pageInfo,
    $core.String? keywords,
  }) {
    final result = create();
    if (pageInfo != null) result.pageInfo = pageInfo;
    if (keywords != null) result.keywords = keywords;
    return result;
  }

  GetDishesReq._();

  factory GetDishesReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishesReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishesReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<$2.PageInfo>(1, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'keywords')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesReq clone() => GetDishesReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesReq copyWith(void Function(GetDishesReq) updates) =>
      super.copyWith((message) => updates(message as GetDishesReq))
          as GetDishesReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesReq create() => GetDishesReq._();
  @$core.override
  GetDishesReq createEmptyInstance() => create();
  static $pb.PbList<GetDishesReq> createRepeated() =>
      $pb.PbList<GetDishesReq>();
  @$core.pragma('dart2js:noInline')
  static GetDishesReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishesReq>(create);
  static GetDishesReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.PageInfo get pageInfo => $_getN(0);
  @$pb.TagNumber(1)
  set pageInfo($2.PageInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPageInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.PageInfo ensurePageInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get keywords => $_getSZ(1);
  @$pb.TagNumber(2)
  set keywords($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeywords() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeywords() => $_clearField(2);
}

class GetDishesResp extends $pb.GeneratedMessage {
  factory GetDishesResp({
    $core.Iterable<Dish>? dishes,
    $2.PageInfo? pageInfo,
  }) {
    final result = create();
    if (dishes != null) result.dishes.addAll(dishes);
    if (pageInfo != null) result.pageInfo = pageInfo;
    return result;
  }

  GetDishesResp._();

  factory GetDishesResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishesResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishesResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<Dish>(1, _omitFieldNames ? '' : 'dishes', $pb.PbFieldType.PM,
        subBuilder: Dish.create)
    ..aOM<$2.PageInfo>(2, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesResp clone() => GetDishesResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesResp copyWith(void Function(GetDishesResp) updates) =>
      super.copyWith((message) => updates(message as GetDishesResp))
          as GetDishesResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesResp create() => GetDishesResp._();
  @$core.override
  GetDishesResp createEmptyInstance() => create();
  static $pb.PbList<GetDishesResp> createRepeated() =>
      $pb.PbList<GetDishesResp>();
  @$core.pragma('dart2js:noInline')
  static GetDishesResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishesResp>(create);
  static GetDishesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Dish> get dishes => $_getList(0);

  @$pb.TagNumber(2)
  $2.PageInfo get pageInfo => $_getN(1);
  @$pb.TagNumber(2)
  set pageInfo($2.PageInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.PageInfo ensurePageInfo() => $_ensure(1);
}

class DishType extends $pb.GeneratedMessage {
  factory DishType({
    $core.int? dishTypeID,
    $core.String? name,
  }) {
    final result = create();
    if (dishTypeID != null) result.dishTypeID = dishTypeID;
    if (name != null) result.name = name;
    return result;
  }

  DishType._();

  factory DishType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DishType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DishType',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'dishTypeID', $pb.PbFieldType.OU3,
        protoName: 'dishTypeID')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishType clone() => DishType()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DishType copyWith(void Function(DishType) updates) =>
      super.copyWith((message) => updates(message as DishType)) as DishType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DishType create() => DishType._();
  @$core.override
  DishType createEmptyInstance() => create();
  static $pb.PbList<DishType> createRepeated() => $pb.PbList<DishType>();
  @$core.pragma('dart2js:noInline')
  static DishType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DishType>(create);
  static DishType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dishTypeID => $_getIZ(0);
  @$pb.TagNumber(1)
  set dishTypeID($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDishTypeID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDishTypeID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class GetDishTypeResp extends $pb.GeneratedMessage {
  factory GetDishTypeResp({
    $core.Iterable<DishType>? dishTypes,
  }) {
    final result = create();
    if (dishTypes != null) result.dishTypes.addAll(dishTypes);
    return result;
  }

  GetDishTypeResp._();

  factory GetDishTypeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishTypeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishTypeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<DishType>(1, _omitFieldNames ? '' : 'dishTypes', $pb.PbFieldType.PM,
        protoName: 'dishTypes', subBuilder: DishType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishTypeResp clone() => GetDishTypeResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishTypeResp copyWith(void Function(GetDishTypeResp) updates) =>
      super.copyWith((message) => updates(message as GetDishTypeResp))
          as GetDishTypeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishTypeResp create() => GetDishTypeResp._();
  @$core.override
  GetDishTypeResp createEmptyInstance() => create();
  static $pb.PbList<GetDishTypeResp> createRepeated() =>
      $pb.PbList<GetDishTypeResp>();
  @$core.pragma('dart2js:noInline')
  static GetDishTypeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishTypeResp>(create);
  static GetDishTypeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DishType> get dishTypes => $_getList(0);
}

class AddDishTypeReq extends $pb.GeneratedMessage {
  factory AddDishTypeReq({
    $core.String? typeName,
  }) {
    final result = create();
    if (typeName != null) result.typeName = typeName;
    return result;
  }

  AddDishTypeReq._();

  factory AddDishTypeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddDishTypeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddDishTypeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'typeName', protoName: 'typeName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDishTypeReq clone() => AddDishTypeReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDishTypeReq copyWith(void Function(AddDishTypeReq) updates) =>
      super.copyWith((message) => updates(message as AddDishTypeReq))
          as AddDishTypeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDishTypeReq create() => AddDishTypeReq._();
  @$core.override
  AddDishTypeReq createEmptyInstance() => create();
  static $pb.PbList<AddDishTypeReq> createRepeated() =>
      $pb.PbList<AddDishTypeReq>();
  @$core.pragma('dart2js:noInline')
  static AddDishTypeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddDishTypeReq>(create);
  static AddDishTypeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTypeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeName() => $_clearField(1);
}

class AddDishTypeResp extends $pb.GeneratedMessage {
  factory AddDishTypeResp({
    $core.int? dishTypeID,
    $core.String? typeName,
  }) {
    final result = create();
    if (dishTypeID != null) result.dishTypeID = dishTypeID;
    if (typeName != null) result.typeName = typeName;
    return result;
  }

  AddDishTypeResp._();

  factory AddDishTypeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddDishTypeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddDishTypeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'dishTypeID', $pb.PbFieldType.OU3,
        protoName: 'dishTypeID')
    ..aOS(2, _omitFieldNames ? '' : 'typeName', protoName: 'typeName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDishTypeResp clone() => AddDishTypeResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDishTypeResp copyWith(void Function(AddDishTypeResp) updates) =>
      super.copyWith((message) => updates(message as AddDishTypeResp))
          as AddDishTypeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDishTypeResp create() => AddDishTypeResp._();
  @$core.override
  AddDishTypeResp createEmptyInstance() => create();
  static $pb.PbList<AddDishTypeResp> createRepeated() =>
      $pb.PbList<AddDishTypeResp>();
  @$core.pragma('dart2js:noInline')
  static AddDishTypeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddDishTypeResp>(create);
  static AddDishTypeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dishTypeID => $_getIZ(0);
  @$pb.TagNumber(1)
  set dishTypeID($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDishTypeID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDishTypeID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get typeName => $_getSZ(1);
  @$pb.TagNumber(2)
  set typeName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTypeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTypeName() => $_clearField(2);
}

class GetMaterialsReq extends $pb.GeneratedMessage {
  factory GetMaterialsReq({
    $2.PageInfo? pageInfo,
    $core.String? keywords,
  }) {
    final result = create();
    if (pageInfo != null) result.pageInfo = pageInfo;
    if (keywords != null) result.keywords = keywords;
    return result;
  }

  GetMaterialsReq._();

  factory GetMaterialsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMaterialsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMaterialsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<$2.PageInfo>(1, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'keywords')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMaterialsReq clone() => GetMaterialsReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMaterialsReq copyWith(void Function(GetMaterialsReq) updates) =>
      super.copyWith((message) => updates(message as GetMaterialsReq))
          as GetMaterialsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMaterialsReq create() => GetMaterialsReq._();
  @$core.override
  GetMaterialsReq createEmptyInstance() => create();
  static $pb.PbList<GetMaterialsReq> createRepeated() =>
      $pb.PbList<GetMaterialsReq>();
  @$core.pragma('dart2js:noInline')
  static GetMaterialsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMaterialsReq>(create);
  static GetMaterialsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $2.PageInfo get pageInfo => $_getN(0);
  @$pb.TagNumber(1)
  set pageInfo($2.PageInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPageInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.PageInfo ensurePageInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get keywords => $_getSZ(1);
  @$pb.TagNumber(2)
  set keywords($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeywords() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeywords() => $_clearField(2);
}

class GetMaterialsResp extends $pb.GeneratedMessage {
  factory GetMaterialsResp({
    $core.Iterable<Material>? materialList,
    $2.PageInfo? pageInfo,
  }) {
    final result = create();
    if (materialList != null) result.materialList.addAll(materialList);
    if (pageInfo != null) result.pageInfo = pageInfo;
    return result;
  }

  GetMaterialsResp._();

  factory GetMaterialsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMaterialsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMaterialsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<Material>(1, _omitFieldNames ? '' : 'materialList', $pb.PbFieldType.PM,
        protoName: 'materialList', subBuilder: Material.create)
    ..aOM<$2.PageInfo>(2, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMaterialsResp clone() => GetMaterialsResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMaterialsResp copyWith(void Function(GetMaterialsResp) updates) =>
      super.copyWith((message) => updates(message as GetMaterialsResp))
          as GetMaterialsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMaterialsResp create() => GetMaterialsResp._();
  @$core.override
  GetMaterialsResp createEmptyInstance() => create();
  static $pb.PbList<GetMaterialsResp> createRepeated() =>
      $pb.PbList<GetMaterialsResp>();
  @$core.pragma('dart2js:noInline')
  static GetMaterialsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMaterialsResp>(create);
  static GetMaterialsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Material> get materialList => $_getList(0);

  @$pb.TagNumber(2)
  $2.PageInfo get pageInfo => $_getN(1);
  @$pb.TagNumber(2)
  set pageInfo($2.PageInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPageInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.PageInfo ensurePageInfo() => $_ensure(1);
}

class CreateOrEditMaterialReq extends $pb.GeneratedMessage {
  factory CreateOrEditMaterialReq({
    Material? material,
  }) {
    final result = create();
    if (material != null) result.material = material;
    return result;
  }

  CreateOrEditMaterialReq._();

  factory CreateOrEditMaterialReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrEditMaterialReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrEditMaterialReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<Material>(1, _omitFieldNames ? '' : 'material',
        subBuilder: Material.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditMaterialReq clone() =>
      CreateOrEditMaterialReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditMaterialReq copyWith(
          void Function(CreateOrEditMaterialReq) updates) =>
      super.copyWith((message) => updates(message as CreateOrEditMaterialReq))
          as CreateOrEditMaterialReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrEditMaterialReq create() => CreateOrEditMaterialReq._();
  @$core.override
  CreateOrEditMaterialReq createEmptyInstance() => create();
  static $pb.PbList<CreateOrEditMaterialReq> createRepeated() =>
      $pb.PbList<CreateOrEditMaterialReq>();
  @$core.pragma('dart2js:noInline')
  static CreateOrEditMaterialReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrEditMaterialReq>(create);
  static CreateOrEditMaterialReq? _defaultInstance;

  @$pb.TagNumber(1)
  Material get material => $_getN(0);
  @$pb.TagNumber(1)
  set material(Material value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMaterial() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaterial() => $_clearField(1);
  @$pb.TagNumber(1)
  Material ensureMaterial() => $_ensure(0);
}

class CreateOrEditMaterialResp extends $pb.GeneratedMessage {
  factory CreateOrEditMaterialResp({
    $core.int? materialId,
  }) {
    final result = create();
    if (materialId != null) result.materialId = materialId;
    return result;
  }

  CreateOrEditMaterialResp._();

  factory CreateOrEditMaterialResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrEditMaterialResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrEditMaterialResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'materialId', $pb.PbFieldType.OU3,
        protoName: 'materialId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditMaterialResp clone() =>
      CreateOrEditMaterialResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditMaterialResp copyWith(
          void Function(CreateOrEditMaterialResp) updates) =>
      super.copyWith((message) => updates(message as CreateOrEditMaterialResp))
          as CreateOrEditMaterialResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrEditMaterialResp create() => CreateOrEditMaterialResp._();
  @$core.override
  CreateOrEditMaterialResp createEmptyInstance() => create();
  static $pb.PbList<CreateOrEditMaterialResp> createRepeated() =>
      $pb.PbList<CreateOrEditMaterialResp>();
  @$core.pragma('dart2js:noInline')
  static CreateOrEditMaterialResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrEditMaterialResp>(create);
  static CreateOrEditMaterialResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get materialId => $_getIZ(0);
  @$pb.TagNumber(1)
  set materialId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMaterialId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaterialId() => $_clearField(1);
}

class CreateOrEditDishReq extends $pb.GeneratedMessage {
  factory CreateOrEditDishReq({
    Dish? dish,
  }) {
    final result = create();
    if (dish != null) result.dish = dish;
    return result;
  }

  CreateOrEditDishReq._();

  factory CreateOrEditDishReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrEditDishReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrEditDishReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<Dish>(1, _omitFieldNames ? '' : 'dish', subBuilder: Dish.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditDishReq clone() => CreateOrEditDishReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditDishReq copyWith(void Function(CreateOrEditDishReq) updates) =>
      super.copyWith((message) => updates(message as CreateOrEditDishReq))
          as CreateOrEditDishReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrEditDishReq create() => CreateOrEditDishReq._();
  @$core.override
  CreateOrEditDishReq createEmptyInstance() => create();
  static $pb.PbList<CreateOrEditDishReq> createRepeated() =>
      $pb.PbList<CreateOrEditDishReq>();
  @$core.pragma('dart2js:noInline')
  static CreateOrEditDishReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrEditDishReq>(create);
  static CreateOrEditDishReq? _defaultInstance;

  @$pb.TagNumber(1)
  Dish get dish => $_getN(0);
  @$pb.TagNumber(1)
  set dish(Dish value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDish() => $_has(0);
  @$pb.TagNumber(1)
  void clearDish() => $_clearField(1);
  @$pb.TagNumber(1)
  Dish ensureDish() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
