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

/// / 座位
class Seat extends $pb.GeneratedMessage {
  factory Seat({
    $core.int? id,
    $core.int? tableId,
    $core.String? seatNumber,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (tableId != null) result.tableId = tableId;
    if (seatNumber != null) result.seatNumber = seatNumber;
    return result;
  }

  Seat._();

  factory Seat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Seat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Seat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'tableId', $pb.PbFieldType.OU3,
        protoName: 'tableId')
    ..aOS(3, _omitFieldNames ? '' : 'seatNumber', protoName: 'seatNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Seat clone() => Seat()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Seat copyWith(void Function(Seat) updates) =>
      super.copyWith((message) => updates(message as Seat)) as Seat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Seat create() => Seat._();
  @$core.override
  Seat createEmptyInstance() => create();
  static $pb.PbList<Seat> createRepeated() => $pb.PbList<Seat>();
  @$core.pragma('dart2js:noInline')
  static Seat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Seat>(create);
  static Seat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get tableId => $_getIZ(1);
  @$pb.TagNumber(2)
  set tableId($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTableId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTableId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get seatNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set seatNumber($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeatNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeatNumber() => $_clearField(3);
}

/// / 餐桌
class Table extends $pb.GeneratedMessage {
  factory Table({
    $core.int? id,
    $core.String? number,
    $core.Iterable<Seat>? seats,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (number != null) result.number = number;
    if (seats != null) result.seats.addAll(seats);
    return result;
  }

  Table._();

  factory Table.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Table.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Table',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'number')
    ..pc<Seat>(3, _omitFieldNames ? '' : 'seats', $pb.PbFieldType.PM,
        subBuilder: Seat.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Table clone() => Table()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Table copyWith(void Function(Table) updates) =>
      super.copyWith((message) => updates(message as Table)) as Table;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Table create() => Table._();
  @$core.override
  Table createEmptyInstance() => create();
  static $pb.PbList<Table> createRepeated() => $pb.PbList<Table>();
  @$core.pragma('dart2js:noInline')
  static Table getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Table>(create);
  static Table? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get number => $_getSZ(1);
  @$pb.TagNumber(2)
  set number($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Seat> get seats => $_getList(2);
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

class GetDishesWithCategoryReq extends $pb.GeneratedMessage {
  factory GetDishesWithCategoryReq({
    $2.PageInfo? pageInfo,
    DishType? category,
  }) {
    final result = create();
    if (pageInfo != null) result.pageInfo = pageInfo;
    if (category != null) result.category = category;
    return result;
  }

  GetDishesWithCategoryReq._();

  factory GetDishesWithCategoryReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishesWithCategoryReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishesWithCategoryReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<$2.PageInfo>(1, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..aOM<DishType>(2, _omitFieldNames ? '' : 'category',
        subBuilder: DishType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesWithCategoryReq clone() =>
      GetDishesWithCategoryReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesWithCategoryReq copyWith(
          void Function(GetDishesWithCategoryReq) updates) =>
      super.copyWith((message) => updates(message as GetDishesWithCategoryReq))
          as GetDishesWithCategoryReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesWithCategoryReq create() => GetDishesWithCategoryReq._();
  @$core.override
  GetDishesWithCategoryReq createEmptyInstance() => create();
  static $pb.PbList<GetDishesWithCategoryReq> createRepeated() =>
      $pb.PbList<GetDishesWithCategoryReq>();
  @$core.pragma('dart2js:noInline')
  static GetDishesWithCategoryReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishesWithCategoryReq>(create);
  static GetDishesWithCategoryReq? _defaultInstance;

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
  DishType get category => $_getN(1);
  @$pb.TagNumber(2)
  set category(DishType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => $_clearField(2);
  @$pb.TagNumber(2)
  DishType ensureCategory() => $_ensure(1);
}

class GetDishesWithCategoryResp extends $pb.GeneratedMessage {
  factory GetDishesWithCategoryResp({
    $core.Iterable<Dish>? dishes,
    $2.PageInfo? pageInfo,
    DishType? category,
  }) {
    final result = create();
    if (dishes != null) result.dishes.addAll(dishes);
    if (pageInfo != null) result.pageInfo = pageInfo;
    if (category != null) result.category = category;
    return result;
  }

  GetDishesWithCategoryResp._();

  factory GetDishesWithCategoryResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDishesWithCategoryResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDishesWithCategoryResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<Dish>(1, _omitFieldNames ? '' : 'dishes', $pb.PbFieldType.PM,
        subBuilder: Dish.create)
    ..aOM<$2.PageInfo>(2, _omitFieldNames ? '' : 'pageInfo',
        protoName: 'pageInfo', subBuilder: $2.PageInfo.create)
    ..aOM<DishType>(3, _omitFieldNames ? '' : 'category',
        subBuilder: DishType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesWithCategoryResp clone() =>
      GetDishesWithCategoryResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDishesWithCategoryResp copyWith(
          void Function(GetDishesWithCategoryResp) updates) =>
      super.copyWith((message) => updates(message as GetDishesWithCategoryResp))
          as GetDishesWithCategoryResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDishesWithCategoryResp create() => GetDishesWithCategoryResp._();
  @$core.override
  GetDishesWithCategoryResp createEmptyInstance() => create();
  static $pb.PbList<GetDishesWithCategoryResp> createRepeated() =>
      $pb.PbList<GetDishesWithCategoryResp>();
  @$core.pragma('dart2js:noInline')
  static GetDishesWithCategoryResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDishesWithCategoryResp>(create);
  static GetDishesWithCategoryResp? _defaultInstance;

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

  @$pb.TagNumber(3)
  DishType get category => $_getN(2);
  @$pb.TagNumber(3)
  set category(DishType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => $_clearField(3);
  @$pb.TagNumber(3)
  DishType ensureCategory() => $_ensure(2);
}

class DeleteDishesReq extends $pb.GeneratedMessage {
  factory DeleteDishesReq({
    $core.Iterable<$core.int>? dishIds,
  }) {
    final result = create();
    if (dishIds != null) result.dishIds.addAll(dishIds);
    return result;
  }

  DeleteDishesReq._();

  factory DeleteDishesReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDishesReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDishesReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'dishIds', $pb.PbFieldType.KU3,
        protoName: 'dishIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishesReq clone() => DeleteDishesReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDishesReq copyWith(void Function(DeleteDishesReq) updates) =>
      super.copyWith((message) => updates(message as DeleteDishesReq))
          as DeleteDishesReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDishesReq create() => DeleteDishesReq._();
  @$core.override
  DeleteDishesReq createEmptyInstance() => create();
  static $pb.PbList<DeleteDishesReq> createRepeated() =>
      $pb.PbList<DeleteDishesReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteDishesReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDishesReq>(create);
  static DeleteDishesReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get dishIds => $_getList(0);
}

class GetAllTablesResp extends $pb.GeneratedMessage {
  factory GetAllTablesResp({
    $core.Iterable<Table>? tables,
  }) {
    final result = create();
    if (tables != null) result.tables.addAll(tables);
    return result;
  }

  GetAllTablesResp._();

  factory GetAllTablesResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetAllTablesResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetAllTablesResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..pc<Table>(1, _omitFieldNames ? '' : 'tables', $pb.PbFieldType.PM,
        subBuilder: Table.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTablesResp clone() => GetAllTablesResp()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetAllTablesResp copyWith(void Function(GetAllTablesResp) updates) =>
      super.copyWith((message) => updates(message as GetAllTablesResp))
          as GetAllTablesResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAllTablesResp create() => GetAllTablesResp._();
  @$core.override
  GetAllTablesResp createEmptyInstance() => create();
  static $pb.PbList<GetAllTablesResp> createRepeated() =>
      $pb.PbList<GetAllTablesResp>();
  @$core.pragma('dart2js:noInline')
  static GetAllTablesResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetAllTablesResp>(create);
  static GetAllTablesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Table> get tables => $_getList(0);
}

class CreateOrEditTableReq extends $pb.GeneratedMessage {
  factory CreateOrEditTableReq({
    Table? table,
  }) {
    final result = create();
    if (table != null) result.table = table;
    return result;
  }

  CreateOrEditTableReq._();

  factory CreateOrEditTableReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrEditTableReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrEditTableReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..aOM<Table>(1, _omitFieldNames ? '' : 'table', subBuilder: Table.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditTableReq clone() =>
      CreateOrEditTableReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrEditTableReq copyWith(void Function(CreateOrEditTableReq) updates) =>
      super.copyWith((message) => updates(message as CreateOrEditTableReq))
          as CreateOrEditTableReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrEditTableReq create() => CreateOrEditTableReq._();
  @$core.override
  CreateOrEditTableReq createEmptyInstance() => create();
  static $pb.PbList<CreateOrEditTableReq> createRepeated() =>
      $pb.PbList<CreateOrEditTableReq>();
  @$core.pragma('dart2js:noInline')
  static CreateOrEditTableReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrEditTableReq>(create);
  static CreateOrEditTableReq? _defaultInstance;

  @$pb.TagNumber(1)
  Table get table => $_getN(0);
  @$pb.TagNumber(1)
  set table(Table value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTable() => $_has(0);
  @$pb.TagNumber(1)
  void clearTable() => $_clearField(1);
  @$pb.TagNumber(1)
  Table ensureTable() => $_ensure(0);
}

class DeleteTableReq extends $pb.GeneratedMessage {
  factory DeleteTableReq({
    $core.int? tableId,
  }) {
    final result = create();
    if (tableId != null) result.tableId = tableId;
    return result;
  }

  DeleteTableReq._();

  factory DeleteTableReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTableReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTableReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'restaurant_rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tableId', $pb.PbFieldType.OU3,
        protoName: 'tableId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTableReq clone() => DeleteTableReq()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTableReq copyWith(void Function(DeleteTableReq) updates) =>
      super.copyWith((message) => updates(message as DeleteTableReq))
          as DeleteTableReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTableReq create() => DeleteTableReq._();
  @$core.override
  DeleteTableReq createEmptyInstance() => create();
  static $pb.PbList<DeleteTableReq> createRepeated() =>
      $pb.PbList<DeleteTableReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteTableReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTableReq>(create);
  static DeleteTableReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tableId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tableId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTableId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTableId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
