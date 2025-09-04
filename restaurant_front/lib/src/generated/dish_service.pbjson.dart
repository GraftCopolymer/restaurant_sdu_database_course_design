// This is a generated file - do not edit.
//
// Generated from dish_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dishDescriptor instead')
const Dish$json = {
  '1': 'Dish',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'imageUrl', '3': 3, '4': 1, '5': 9, '10': 'imageUrl'},
    {
      '1': 'dishType',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.DishType',
      '10': 'dishType'
    },
    {
      '1': 'portions',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.DishPortion',
      '10': 'portions'
    },
  ],
};

/// Descriptor for `Dish`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishDescriptor = $convert.base64Decode(
    'CgREaXNoEg4KAmlkGAEgASgNUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhoKCGltYWdlVXJsGA'
    'MgASgJUghpbWFnZVVybBI0CghkaXNoVHlwZRgEIAEoCzIYLnJlc3RhdXJhbnRfcnBjLkRpc2hU'
    'eXBlUghkaXNoVHlwZRI3Cghwb3J0aW9ucxgFIAMoCzIbLnJlc3RhdXJhbnRfcnBjLkRpc2hQb3'
    'J0aW9uUghwb3J0aW9ucw==');

@$core.Deprecated('Use dishPortionDescriptor instead')
const DishPortion$json = {
  '1': 'DishPortion',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
    {
      '1': 'portionType',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.restaurant.DishPortion',
      '10': 'portionType'
    },
    {
      '1': 'recipe',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Recipe',
      '10': 'recipe'
    },
  ],
};

/// Descriptor for `DishPortion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishPortionDescriptor = $convert.base64Decode(
    'CgtEaXNoUG9ydGlvbhIOCgJpZBgBIAEoDVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVwcm'
    'ljZRgDIAEoCVIFcHJpY2USOQoLcG9ydGlvblR5cGUYBCABKA4yFy5yZXN0YXVyYW50LkRpc2hQ'
    'b3J0aW9uUgtwb3J0aW9uVHlwZRIuCgZyZWNpcGUYBSABKAsyFi5yZXN0YXVyYW50X3JwYy5SZW'
    'NpcGVSBnJlY2lwZQ==');

@$core.Deprecated('Use recipeDescriptor instead')
const Recipe$json = {
  '1': 'Recipe',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {
      '1': 'materials',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.RecipeMaterial',
      '10': 'materials'
    },
  ],
};

/// Descriptor for `Recipe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recipeDescriptor = $convert.base64Decode(
    'CgZSZWNpcGUSDgoCaWQYASABKA1SAmlkEjwKCW1hdGVyaWFscxgCIAMoCzIeLnJlc3RhdXJhbn'
    'RfcnBjLlJlY2lwZU1hdGVyaWFsUgltYXRlcmlhbHM=');

@$core.Deprecated('Use recipeMaterialDescriptor instead')
const RecipeMaterial$json = {
  '1': 'RecipeMaterial',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {
      '1': 'material',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Material',
      '10': 'material'
    },
    {'1': 'quantity', '3': 3, '4': 1, '5': 9, '10': 'quantity'},
  ],
};

/// Descriptor for `RecipeMaterial`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recipeMaterialDescriptor = $convert.base64Decode(
    'Cg5SZWNpcGVNYXRlcmlhbBIOCgJpZBgBIAEoDVICaWQSNAoIbWF0ZXJpYWwYAiABKAsyGC5yZX'
    'N0YXVyYW50X3JwYy5NYXRlcmlhbFIIbWF0ZXJpYWwSGgoIcXVhbnRpdHkYAyABKAlSCHF1YW50'
    'aXR5');

@$core.Deprecated('Use materialDescriptor instead')
const Material$json = {
  '1': 'Material',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
    {
      '1': 'unitType',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.restaurant.UnitType',
      '10': 'unitType'
    },
    {'1': 'amount', '3': 5, '4': 1, '5': 9, '10': 'amount'},
  ],
};

/// Descriptor for `Material`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List materialDescriptor = $convert.base64Decode(
    'CghNYXRlcmlhbBIOCgJpZBgBIAEoDVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIUCgVwcmljZR'
    'gDIAEoCVIFcHJpY2USMAoIdW5pdFR5cGUYBCABKA4yFC5yZXN0YXVyYW50LlVuaXRUeXBlUgh1'
    'bml0VHlwZRIWCgZhbW91bnQYBSABKAlSBmFtb3VudA==');

@$core.Deprecated('Use seatDescriptor instead')
const Seat$json = {
  '1': 'Seat',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'tableId', '3': 2, '4': 1, '5': 13, '10': 'tableId'},
    {'1': 'seatNumber', '3': 3, '4': 1, '5': 9, '10': 'seatNumber'},
  ],
};

/// Descriptor for `Seat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List seatDescriptor = $convert.base64Decode(
    'CgRTZWF0Eg4KAmlkGAEgASgNUgJpZBIYCgd0YWJsZUlkGAIgASgNUgd0YWJsZUlkEh4KCnNlYX'
    'ROdW1iZXIYAyABKAlSCnNlYXROdW1iZXI=');

@$core.Deprecated('Use tableDescriptor instead')
const Table$json = {
  '1': 'Table',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'number', '3': 2, '4': 1, '5': 9, '10': 'number'},
    {
      '1': 'seats',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Seat',
      '10': 'seats'
    },
  ],
};

/// Descriptor for `Table`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tableDescriptor = $convert.base64Decode(
    'CgVUYWJsZRIOCgJpZBgBIAEoDVICaWQSFgoGbnVtYmVyGAIgASgJUgZudW1iZXISKgoFc2VhdH'
    'MYAyADKAsyFC5yZXN0YXVyYW50X3JwYy5TZWF0UgVzZWF0cw==');

@$core.Deprecated('Use getDishesReqDescriptor instead')
const GetDishesReq$json = {
  '1': 'GetDishesReq',
  '2': [
    {
      '1': 'pageInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
    {'1': 'keywords', '3': 2, '4': 1, '5': 9, '10': 'keywords'},
  ],
};

/// Descriptor for `GetDishesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesReqDescriptor = $convert.base64Decode(
    'CgxHZXREaXNoZXNSZXESNAoIcGFnZUluZm8YASABKAsyGC5yZXN0YXVyYW50X3JwYy5QYWdlSW'
    '5mb1IIcGFnZUluZm8SGgoIa2V5d29yZHMYAiABKAlSCGtleXdvcmRz');

@$core.Deprecated('Use getDishesRespDescriptor instead')
const GetDishesResp$json = {
  '1': 'GetDishesResp',
  '2': [
    {
      '1': 'dishes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Dish',
      '10': 'dishes'
    },
    {
      '1': 'pageInfo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
  ],
};

/// Descriptor for `GetDishesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesRespDescriptor = $convert.base64Decode(
    'Cg1HZXREaXNoZXNSZXNwEiwKBmRpc2hlcxgBIAMoCzIULnJlc3RhdXJhbnRfcnBjLkRpc2hSBm'
    'Rpc2hlcxI0CghwYWdlSW5mbxgCIAEoCzIYLnJlc3RhdXJhbnRfcnBjLlBhZ2VJbmZvUghwYWdl'
    'SW5mbw==');

@$core.Deprecated('Use dishTypeDescriptor instead')
const DishType$json = {
  '1': 'DishType',
  '2': [
    {'1': 'dishTypeID', '3': 1, '4': 1, '5': 13, '10': 'dishTypeID'},
    {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
  ],
};

/// Descriptor for `DishType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dishTypeDescriptor = $convert.base64Decode(
    'CghEaXNoVHlwZRIeCgpkaXNoVHlwZUlEGAEgASgNUgpkaXNoVHlwZUlEEhIKBE5hbWUYAiABKA'
    'lSBE5hbWU=');

@$core.Deprecated('Use getDishTypeRespDescriptor instead')
const GetDishTypeResp$json = {
  '1': 'GetDishTypeResp',
  '2': [
    {
      '1': 'dishTypes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.DishType',
      '10': 'dishTypes'
    },
  ],
};

/// Descriptor for `GetDishTypeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishTypeRespDescriptor = $convert.base64Decode(
    'Cg9HZXREaXNoVHlwZVJlc3ASNgoJZGlzaFR5cGVzGAEgAygLMhgucmVzdGF1cmFudF9ycGMuRG'
    'lzaFR5cGVSCWRpc2hUeXBlcw==');

@$core.Deprecated('Use addDishTypeReqDescriptor instead')
const AddDishTypeReq$json = {
  '1': 'AddDishTypeReq',
  '2': [
    {'1': 'typeName', '3': 1, '4': 1, '5': 9, '10': 'typeName'},
  ],
};

/// Descriptor for `AddDishTypeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDishTypeReqDescriptor = $convert.base64Decode(
    'Cg5BZGREaXNoVHlwZVJlcRIaCgh0eXBlTmFtZRgBIAEoCVIIdHlwZU5hbWU=');

@$core.Deprecated('Use addDishTypeRespDescriptor instead')
const AddDishTypeResp$json = {
  '1': 'AddDishTypeResp',
  '2': [
    {'1': 'dishTypeID', '3': 1, '4': 1, '5': 13, '10': 'dishTypeID'},
    {'1': 'typeName', '3': 2, '4': 1, '5': 9, '10': 'typeName'},
  ],
};

/// Descriptor for `AddDishTypeResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDishTypeRespDescriptor = $convert.base64Decode(
    'Cg9BZGREaXNoVHlwZVJlc3ASHgoKZGlzaFR5cGVJRBgBIAEoDVIKZGlzaFR5cGVJRBIaCgh0eX'
    'BlTmFtZRgCIAEoCVIIdHlwZU5hbWU=');

@$core.Deprecated('Use getMaterialsReqDescriptor instead')
const GetMaterialsReq$json = {
  '1': 'GetMaterialsReq',
  '2': [
    {
      '1': 'pageInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
    {'1': 'keywords', '3': 2, '4': 1, '5': 9, '10': 'keywords'},
  ],
};

/// Descriptor for `GetMaterialsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMaterialsReqDescriptor = $convert.base64Decode(
    'Cg9HZXRNYXRlcmlhbHNSZXESNAoIcGFnZUluZm8YASABKAsyGC5yZXN0YXVyYW50X3JwYy5QYW'
    'dlSW5mb1IIcGFnZUluZm8SGgoIa2V5d29yZHMYAiABKAlSCGtleXdvcmRz');

@$core.Deprecated('Use getMaterialsRespDescriptor instead')
const GetMaterialsResp$json = {
  '1': 'GetMaterialsResp',
  '2': [
    {
      '1': 'materialList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Material',
      '10': 'materialList'
    },
    {
      '1': 'pageInfo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
  ],
};

/// Descriptor for `GetMaterialsResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMaterialsRespDescriptor = $convert.base64Decode(
    'ChBHZXRNYXRlcmlhbHNSZXNwEjwKDG1hdGVyaWFsTGlzdBgBIAMoCzIYLnJlc3RhdXJhbnRfcn'
    'BjLk1hdGVyaWFsUgxtYXRlcmlhbExpc3QSNAoIcGFnZUluZm8YAiABKAsyGC5yZXN0YXVyYW50'
    'X3JwYy5QYWdlSW5mb1IIcGFnZUluZm8=');

@$core.Deprecated('Use createOrEditMaterialReqDescriptor instead')
const CreateOrEditMaterialReq$json = {
  '1': 'CreateOrEditMaterialReq',
  '2': [
    {
      '1': 'material',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Material',
      '10': 'material'
    },
  ],
};

/// Descriptor for `CreateOrEditMaterialReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrEditMaterialReqDescriptor =
    $convert.base64Decode(
        'ChdDcmVhdGVPckVkaXRNYXRlcmlhbFJlcRI0CghtYXRlcmlhbBgBIAEoCzIYLnJlc3RhdXJhbn'
        'RfcnBjLk1hdGVyaWFsUghtYXRlcmlhbA==');

@$core.Deprecated('Use createOrEditMaterialRespDescriptor instead')
const CreateOrEditMaterialResp$json = {
  '1': 'CreateOrEditMaterialResp',
  '2': [
    {'1': 'materialId', '3': 1, '4': 1, '5': 13, '10': 'materialId'},
  ],
};

/// Descriptor for `CreateOrEditMaterialResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrEditMaterialRespDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVPckVkaXRNYXRlcmlhbFJlc3ASHgoKbWF0ZXJpYWxJZBgBIAEoDVIKbWF0ZXJpYW'
        'xJZA==');

@$core.Deprecated('Use createOrEditDishReqDescriptor instead')
const CreateOrEditDishReq$json = {
  '1': 'CreateOrEditDishReq',
  '2': [
    {
      '1': 'dish',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Dish',
      '10': 'dish'
    },
  ],
};

/// Descriptor for `CreateOrEditDishReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrEditDishReqDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVPckVkaXREaXNoUmVxEigKBGRpc2gYASABKAsyFC5yZXN0YXVyYW50X3JwYy5EaX'
    'NoUgRkaXNo');

@$core.Deprecated('Use getDishesWithCategoryReqDescriptor instead')
const GetDishesWithCategoryReq$json = {
  '1': 'GetDishesWithCategoryReq',
  '2': [
    {
      '1': 'pageInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
    {
      '1': 'category',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.DishType',
      '10': 'category'
    },
  ],
};

/// Descriptor for `GetDishesWithCategoryReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesWithCategoryReqDescriptor = $convert.base64Decode(
    'ChhHZXREaXNoZXNXaXRoQ2F0ZWdvcnlSZXESNAoIcGFnZUluZm8YASABKAsyGC5yZXN0YXVyYW'
    '50X3JwYy5QYWdlSW5mb1IIcGFnZUluZm8SNAoIY2F0ZWdvcnkYAiABKAsyGC5yZXN0YXVyYW50'
    'X3JwYy5EaXNoVHlwZVIIY2F0ZWdvcnk=');

@$core.Deprecated('Use getDishesWithCategoryRespDescriptor instead')
const GetDishesWithCategoryResp$json = {
  '1': 'GetDishesWithCategoryResp',
  '2': [
    {
      '1': 'dishes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Dish',
      '10': 'dishes'
    },
    {
      '1': 'pageInfo',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.PageInfo',
      '10': 'pageInfo'
    },
    {
      '1': 'category',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.DishType',
      '10': 'category'
    },
  ],
};

/// Descriptor for `GetDishesWithCategoryResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDishesWithCategoryRespDescriptor = $convert.base64Decode(
    'ChlHZXREaXNoZXNXaXRoQ2F0ZWdvcnlSZXNwEiwKBmRpc2hlcxgBIAMoCzIULnJlc3RhdXJhbn'
    'RfcnBjLkRpc2hSBmRpc2hlcxI0CghwYWdlSW5mbxgCIAEoCzIYLnJlc3RhdXJhbnRfcnBjLlBh'
    'Z2VJbmZvUghwYWdlSW5mbxI0CghjYXRlZ29yeRgDIAEoCzIYLnJlc3RhdXJhbnRfcnBjLkRpc2'
    'hUeXBlUghjYXRlZ29yeQ==');

@$core.Deprecated('Use deleteDishesReqDescriptor instead')
const DeleteDishesReq$json = {
  '1': 'DeleteDishesReq',
  '2': [
    {'1': 'dishIds', '3': 1, '4': 3, '5': 13, '10': 'dishIds'},
  ],
};

/// Descriptor for `DeleteDishesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDishesReqDescriptor = $convert.base64Decode(
    'Cg9EZWxldGVEaXNoZXNSZXESGAoHZGlzaElkcxgBIAMoDVIHZGlzaElkcw==');

@$core.Deprecated('Use getAllTablesRespDescriptor instead')
const GetAllTablesResp$json = {
  '1': 'GetAllTablesResp',
  '2': [
    {
      '1': 'tables',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.Table',
      '10': 'tables'
    },
  ],
};

/// Descriptor for `GetAllTablesResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllTablesRespDescriptor = $convert.base64Decode(
    'ChBHZXRBbGxUYWJsZXNSZXNwEi0KBnRhYmxlcxgBIAMoCzIVLnJlc3RhdXJhbnRfcnBjLlRhYm'
    'xlUgZ0YWJsZXM=');

@$core.Deprecated('Use createOrEditTableReqDescriptor instead')
const CreateOrEditTableReq$json = {
  '1': 'CreateOrEditTableReq',
  '2': [
    {
      '1': 'table',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Table',
      '10': 'table'
    },
  ],
};

/// Descriptor for `CreateOrEditTableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrEditTableReqDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVPckVkaXRUYWJsZVJlcRIrCgV0YWJsZRgBIAEoCzIVLnJlc3RhdXJhbnRfcnBjLl'
    'RhYmxlUgV0YWJsZQ==');

@$core.Deprecated('Use deleteTableReqDescriptor instead')
const DeleteTableReq$json = {
  '1': 'DeleteTableReq',
  '2': [
    {'1': 'tableId', '3': 1, '4': 1, '5': 13, '10': 'tableId'},
  ],
};

/// Descriptor for `DeleteTableReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTableReqDescriptor = $convert
    .base64Decode('Cg5EZWxldGVUYWJsZVJlcRIYCgd0YWJsZUlkGAEgASgNUgd0YWJsZUlk');

@$core.Deprecated('Use orderItemDescriptor instead')
const OrderItem$json = {
  '1': 'OrderItem',
  '2': [
    {'1': 'dishId', '3': 1, '4': 1, '5': 13, '10': 'dishId'},
    {'1': 'portionId', '3': 2, '4': 1, '5': 13, '10': 'portionId'},
    {'1': 'count', '3': 3, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `OrderItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderItemDescriptor = $convert.base64Decode(
    'CglPcmRlckl0ZW0SFgoGZGlzaElkGAEgASgNUgZkaXNoSWQSHAoJcG9ydGlvbklkGAIgASgNUg'
    'lwb3J0aW9uSWQSFAoFY291bnQYAyABKA1SBWNvdW50');

@$core.Deprecated('Use placeOrderReqDescriptor instead')
const PlaceOrderReq$json = {
  '1': 'PlaceOrderReq',
  '2': [
    {
      '1': 'orderItems',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.OrderItem',
      '10': 'orderItems'
    },
    {
      '1': 'orderType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.restaurant.OrderType',
      '10': 'orderType'
    },
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {
      '1': 'table',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Table',
      '10': 'table'
    },
  ],
};

/// Descriptor for `PlaceOrderReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeOrderReqDescriptor = $convert.base64Decode(
    'Cg1QbGFjZU9yZGVyUmVxEjkKCm9yZGVySXRlbXMYASADKAsyGS5yZXN0YXVyYW50X3JwYy5Pcm'
    'Rlckl0ZW1SCm9yZGVySXRlbXMSMwoJb3JkZXJUeXBlGAIgASgOMhUucmVzdGF1cmFudC5PcmRl'
    'clR5cGVSCW9yZGVyVHlwZRIYCgdhZGRyZXNzGAMgASgJUgdhZGRyZXNzEisKBXRhYmxlGAQgAS'
    'gLMhUucmVzdGF1cmFudF9ycGMuVGFibGVSBXRhYmxl');

@$core.Deprecated('Use orderInfoItemDescriptor instead')
const OrderInfoItem$json = {
  '1': 'OrderInfoItem',
  '2': [
    {'1': 'dishId', '3': 1, '4': 1, '5': 13, '10': 'dishId'},
    {'1': 'portionId', '3': 2, '4': 1, '5': 13, '10': 'portionId'},
    {'1': 'count', '3': 3, '4': 1, '5': 13, '10': 'count'},
    {
      '1': 'dish',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Dish',
      '10': 'dish'
    },
    {
      '1': 'portion',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.DishPortion',
      '10': 'portion'
    },
  ],
};

/// Descriptor for `OrderInfoItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderInfoItemDescriptor = $convert.base64Decode(
    'Cg1PcmRlckluZm9JdGVtEhYKBmRpc2hJZBgBIAEoDVIGZGlzaElkEhwKCXBvcnRpb25JZBgCIA'
    'EoDVIJcG9ydGlvbklkEhQKBWNvdW50GAMgASgNUgVjb3VudBIoCgRkaXNoGAQgASgLMhQucmVz'
    'dGF1cmFudF9ycGMuRGlzaFIEZGlzaBI1Cgdwb3J0aW9uGAUgASgLMhsucmVzdGF1cmFudF9ycG'
    'MuRGlzaFBvcnRpb25SB3BvcnRpb24=');

@$core.Deprecated('Use orderInfoDescriptor instead')
const OrderInfo$json = {
  '1': 'OrderInfo',
  '2': [
    {'1': 'orderId', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
    {
      '1': 'orderType',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.restaurant.OrderType',
      '10': 'orderType'
    },
    {
      '1': 'table',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.Table',
      '10': 'table'
    },
    {'1': 'createdAt', '3': 4, '4': 1, '5': 3, '10': 'createdAt'},
    {
      '1': 'orderInfoItems',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.OrderInfoItem',
      '10': 'orderInfoItems'
    },
    {'1': 'totalPrice', '3': 6, '4': 1, '5': 9, '10': 'totalPrice'},
    {'1': 'customerId', '3': 7, '4': 1, '5': 13, '10': 'customerId'},
  ],
};

/// Descriptor for `OrderInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderInfoDescriptor = $convert.base64Decode(
    'CglPcmRlckluZm8SGAoHb3JkZXJJZBgBIAEoDVIHb3JkZXJJZBIzCglvcmRlclR5cGUYAiABKA'
    '4yFS5yZXN0YXVyYW50Lk9yZGVyVHlwZVIJb3JkZXJUeXBlEisKBXRhYmxlGAMgASgLMhUucmVz'
    'dGF1cmFudF9ycGMuVGFibGVSBXRhYmxlEhwKCWNyZWF0ZWRBdBgEIAEoA1IJY3JlYXRlZEF0Ek'
    'UKDm9yZGVySW5mb0l0ZW1zGAUgAygLMh0ucmVzdGF1cmFudF9ycGMuT3JkZXJJbmZvSXRlbVIO'
    'b3JkZXJJbmZvSXRlbXMSHgoKdG90YWxQcmljZRgGIAEoCVIKdG90YWxQcmljZRIeCgpjdXN0b2'
    '1lcklkGAcgASgNUgpjdXN0b21lcklk');

@$core.Deprecated('Use getOrderInfoReqDescriptor instead')
const GetOrderInfoReq$json = {
  '1': 'GetOrderInfoReq',
  '2': [
    {'1': 'orderId', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
  ],
};

/// Descriptor for `GetOrderInfoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderInfoReqDescriptor = $convert.base64Decode(
    'Cg9HZXRPcmRlckluZm9SZXESGAoHb3JkZXJJZBgBIAEoDVIHb3JkZXJJZA==');

@$core.Deprecated('Use getOrderInfoRespDescriptor instead')
const GetOrderInfoResp$json = {
  '1': 'GetOrderInfoResp',
  '2': [
    {
      '1': 'orderInfo',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.OrderInfo',
      '10': 'orderInfo'
    },
  ],
};

/// Descriptor for `GetOrderInfoResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderInfoRespDescriptor = $convert.base64Decode(
    'ChBHZXRPcmRlckluZm9SZXNwEjcKCW9yZGVySW5mbxgBIAEoCzIZLnJlc3RhdXJhbnRfcnBjLk'
    '9yZGVySW5mb1IJb3JkZXJJbmZv');

@$core.Deprecated('Use orderSimpleInfoDescriptor instead')
const OrderSimpleInfo$json = {
  '1': 'OrderSimpleInfo',
  '2': [
    {'1': 'orderId', '3': 1, '4': 1, '5': 13, '10': 'orderId'},
    {'1': 'totalPrice', '3': 2, '4': 1, '5': 9, '10': 'totalPrice'},
    {'1': 'createdAt', '3': 3, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `OrderSimpleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderSimpleInfoDescriptor = $convert.base64Decode(
    'Cg9PcmRlclNpbXBsZUluZm8SGAoHb3JkZXJJZBgBIAEoDVIHb3JkZXJJZBIeCgp0b3RhbFByaW'
    'NlGAIgASgJUgp0b3RhbFByaWNlEhwKCWNyZWF0ZWRBdBgDIAEoA1IJY3JlYXRlZEF0');

@$core.Deprecated('Use getAllOrdersRespDescriptor instead')
const GetAllOrdersResp$json = {
  '1': 'GetAllOrdersResp',
  '2': [
    {
      '1': 'orderInfoList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.OrderSimpleInfo',
      '10': 'orderInfoList'
    },
  ],
};

/// Descriptor for `GetAllOrdersResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllOrdersRespDescriptor = $convert.base64Decode(
    'ChBHZXRBbGxPcmRlcnNSZXNwEkUKDW9yZGVySW5mb0xpc3QYASADKAsyHy5yZXN0YXVyYW50X3'
    'JwYy5PcmRlclNpbXBsZUluZm9SDW9yZGVySW5mb0xpc3Q=');
