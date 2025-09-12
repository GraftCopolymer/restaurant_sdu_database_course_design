// This is a generated file - do not edit.
//
// Generated from cost_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use costInfoDescriptor instead')
const CostInfo$json = {
  '1': 'CostInfo',
  '2': [
    {'1': 'costId', '3': 1, '4': 1, '5': 13, '10': 'costId'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {
      '1': 'costType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.CostType',
      '10': 'costType'
    },
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'createdAt', '3': 5, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `CostInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List costInfoDescriptor = $convert.base64Decode(
    'CghDb3N0SW5mbxIWCgZjb3N0SWQYASABKA1SBmNvc3RJZBIUCgV2YWx1ZRgCIAEoCVIFdmFsdW'
    'USNAoIY29zdFR5cGUYAyABKA4yGC5yZXN0YXVyYW50X3JwYy5Db3N0VHlwZVIIY29zdFR5cGUS'
    'IAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEhwKCWNyZWF0ZWRBdBgFIAEoA1IJY3'
    'JlYXRlZEF0');

@$core.Deprecated('Use costDistributionDescriptor instead')
const CostDistribution$json = {
  '1': 'CostDistribution',
  '2': [
    {'1': 'desc', '3': 1, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {'1': 'total', '3': 3, '4': 1, '5': 9, '10': 'total'},
    {
      '1': 'costType',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.CostType',
      '10': 'costType'
    },
  ],
};

/// Descriptor for `CostDistribution`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List costDistributionDescriptor = $convert.base64Decode(
    'ChBDb3N0RGlzdHJpYnV0aW9uEhIKBGRlc2MYASABKAlSBGRlc2MSFAoFdmFsdWUYAiABKAlSBX'
    'ZhbHVlEhQKBXRvdGFsGAMgASgJUgV0b3RhbBI0Cghjb3N0VHlwZRgEIAEoDjIYLnJlc3RhdXJh'
    'bnRfcnBjLkNvc3RUeXBlUghjb3N0VHlwZQ==');

@$core.Deprecated('Use costDistributionDataDescriptor instead')
const CostDistributionData$json = {
  '1': 'CostDistributionData',
  '2': [
    {
      '1': 'costDistributionList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.CostDistribution',
      '10': 'costDistributionList'
    },
  ],
};

/// Descriptor for `CostDistributionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List costDistributionDataDescriptor = $convert.base64Decode(
    'ChRDb3N0RGlzdHJpYnV0aW9uRGF0YRJUChRjb3N0RGlzdHJpYnV0aW9uTGlzdBgBIAMoCzIgLn'
    'Jlc3RhdXJhbnRfcnBjLkNvc3REaXN0cmlidXRpb25SFGNvc3REaXN0cmlidXRpb25MaXN0');

@$core.Deprecated('Use salaryRankDataDescriptor instead')
const SalaryRankData$json = {
  '1': 'SalaryRankData',
  '2': [
    {
      '1': 'salaryRankList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.SalaryRankData.SalaryRankItem',
      '10': 'salaryRankList'
    },
  ],
  '3': [SalaryRankData_SalaryRankItem$json],
};

@$core.Deprecated('Use salaryRankDataDescriptor instead')
const SalaryRankData_SalaryRankItem$json = {
  '1': 'SalaryRankItem',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'employeeId', '3': 3, '4': 1, '5': 13, '10': 'employeeId'},
    {'1': 'salary', '3': 4, '4': 1, '5': 9, '10': 'salary'},
  ],
};

/// Descriptor for `SalaryRankData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salaryRankDataDescriptor = $convert.base64Decode(
    'Cg5TYWxhcnlSYW5rRGF0YRJVCg5zYWxhcnlSYW5rTGlzdBgBIAMoCzItLnJlc3RhdXJhbnRfcn'
    'BjLlNhbGFyeVJhbmtEYXRhLlNhbGFyeVJhbmtJdGVtUg5zYWxhcnlSYW5rTGlzdBpyCg5TYWxh'
    'cnlSYW5rSXRlbRISCgRuYW1lGAEgASgJUgRuYW1lEhQKBXBob25lGAIgASgJUgVwaG9uZRIeCg'
    'plbXBsb3llZUlkGAMgASgNUgplbXBsb3llZUlkEhYKBnNhbGFyeRgEIAEoCVIGc2FsYXJ5');

@$core.Deprecated('Use costChartDataDescriptor instead')
const CostChartData$json = {
  '1': 'CostChartData',
  '2': [
    {
      '1': 'costDistribution',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.CostDistributionData',
      '10': 'costDistribution'
    },
    {
      '1': 'salaryRank',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.SalaryRankData',
      '10': 'salaryRank'
    },
  ],
};

/// Descriptor for `CostChartData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List costChartDataDescriptor = $convert.base64Decode(
    'Cg1Db3N0Q2hhcnREYXRhElAKEGNvc3REaXN0cmlidXRpb24YASABKAsyJC5yZXN0YXVyYW50X3'
    'JwYy5Db3N0RGlzdHJpYnV0aW9uRGF0YVIQY29zdERpc3RyaWJ1dGlvbhI+CgpzYWxhcnlSYW5r'
    'GAIgASgLMh4ucmVzdGF1cmFudF9ycGMuU2FsYXJ5UmFua0RhdGFSCnNhbGFyeVJhbms=');

@$core.Deprecated('Use monthlyCostDescriptor instead')
const MonthlyCost$json = {
  '1': 'MonthlyCost',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 13, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `MonthlyCost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monthlyCostDescriptor = $convert.base64Decode(
    'CgtNb250aGx5Q29zdBISCgR5ZWFyGAEgASgNUgR5ZWFyEhQKBW1vbnRoGAIgASgNUgVtb250aB'
    'IUCgV2YWx1ZRgDIAEoCVIFdmFsdWU=');

@$core.Deprecated('Use monthlyIncomeDescriptor instead')
const MonthlyIncome$json = {
  '1': 'MonthlyIncome',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 13, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `MonthlyIncome`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monthlyIncomeDescriptor = $convert.base64Decode(
    'Cg1Nb250aGx5SW5jb21lEhIKBHllYXIYASABKA1SBHllYXISFAoFbW9udGgYAiABKA1SBW1vbn'
    'RoEhQKBXZhbHVlGAMgASgJUgV2YWx1ZQ==');

@$core.Deprecated('Use monthlyCostAndIncomeListDescriptor instead')
const MonthlyCostAndIncomeList$json = {
  '1': 'MonthlyCostAndIncomeList',
  '2': [
    {
      '1': 'monthlyCostList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.MonthlyCost',
      '10': 'monthlyCostList'
    },
    {
      '1': 'monthlyIncomeList',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.MonthlyIncome',
      '10': 'monthlyIncomeList'
    },
  ],
};

/// Descriptor for `MonthlyCostAndIncomeList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monthlyCostAndIncomeListDescriptor = $convert.base64Decode(
    'ChhNb250aGx5Q29zdEFuZEluY29tZUxpc3QSRQoPbW9udGhseUNvc3RMaXN0GAEgAygLMhsucm'
    'VzdGF1cmFudF9ycGMuTW9udGhseUNvc3RSD21vbnRobHlDb3N0TGlzdBJLChFtb250aGx5SW5j'
    'b21lTGlzdBgCIAMoCzIdLnJlc3RhdXJhbnRfcnBjLk1vbnRobHlJbmNvbWVSEW1vbnRobHlJbm'
    'NvbWVMaXN0');

@$core.Deprecated('Use getAllCostReqDescriptor instead')
const GetAllCostReq$json = {
  '1': 'GetAllCostReq',
  '2': [
    {
      '1': 'costType',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.CostType',
      '10': 'costType'
    },
  ],
};

/// Descriptor for `GetAllCostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllCostReqDescriptor = $convert.base64Decode(
    'Cg1HZXRBbGxDb3N0UmVxEjQKCGNvc3RUeXBlGAEgASgOMhgucmVzdGF1cmFudF9ycGMuQ29zdF'
    'R5cGVSCGNvc3RUeXBl');

@$core.Deprecated('Use getAllCostRespDescriptor instead')
const GetAllCostResp$json = {
  '1': 'GetAllCostResp',
  '2': [
    {
      '1': 'costInfoList',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.restaurant_rpc.CostInfo',
      '10': 'costInfoList'
    },
  ],
};

/// Descriptor for `GetAllCostResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAllCostRespDescriptor = $convert.base64Decode(
    'Cg5HZXRBbGxDb3N0UmVzcBI8Cgxjb3N0SW5mb0xpc3QYASADKAsyGC5yZXN0YXVyYW50X3JwYy'
    '5Db3N0SW5mb1IMY29zdEluZm9MaXN0');

@$core.Deprecated('Use deleteCostsReqDescriptor instead')
const DeleteCostsReq$json = {
  '1': 'DeleteCostsReq',
  '2': [
    {'1': 'costIdList', '3': 1, '4': 3, '5': 13, '10': 'costIdList'},
  ],
};

/// Descriptor for `DeleteCostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCostsReqDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVDb3N0c1JlcRIeCgpjb3N0SWRMaXN0GAEgAygNUgpjb3N0SWRMaXN0');

@$core.Deprecated('Use getCostChartDataRespDescriptor instead')
const GetCostChartDataResp$json = {
  '1': 'GetCostChartDataResp',
  '2': [
    {
      '1': 'costChartData',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.CostChartData',
      '10': 'costChartData'
    },
  ],
};

/// Descriptor for `GetCostChartDataResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCostChartDataRespDescriptor = $convert.base64Decode(
    'ChRHZXRDb3N0Q2hhcnREYXRhUmVzcBJDCg1jb3N0Q2hhcnREYXRhGAEgASgLMh0ucmVzdGF1cm'
    'FudF9ycGMuQ29zdENoYXJ0RGF0YVINY29zdENoYXJ0RGF0YQ==');

@$core.Deprecated('Use addCostItemReqDescriptor instead')
const AddCostItemReq$json = {
  '1': 'AddCostItemReq',
  '2': [
    {'1': 'desc', '3': 1, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    {
      '1': 'costType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.restaurant_rpc.CostType',
      '10': 'costType'
    },
    {'1': 'createdAt', '3': 4, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `AddCostItemReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCostItemReqDescriptor = $convert.base64Decode(
    'Cg5BZGRDb3N0SXRlbVJlcRISCgRkZXNjGAEgASgJUgRkZXNjEhQKBXZhbHVlGAIgASgJUgV2YW'
    'x1ZRI0Cghjb3N0VHlwZRgDIAEoDjIYLnJlc3RhdXJhbnRfcnBjLkNvc3RUeXBlUghjb3N0VHlw'
    'ZRIcCgljcmVhdGVkQXQYBCABKANSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use getMonthlyCostTrendReqDescriptor instead')
const GetMonthlyCostTrendReq$json = {
  '1': 'GetMonthlyCostTrendReq',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 13, '10': 'year'},
  ],
};

/// Descriptor for `GetMonthlyCostTrendReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMonthlyCostTrendReqDescriptor =
    $convert.base64Decode(
        'ChZHZXRNb250aGx5Q29zdFRyZW5kUmVxEhIKBHllYXIYASABKA1SBHllYXI=');

@$core.Deprecated('Use getMonthlyCostTrendRespDescriptor instead')
const GetMonthlyCostTrendResp$json = {
  '1': 'GetMonthlyCostTrendResp',
  '2': [
    {
      '1': 'monthlyCostTrend',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.restaurant_rpc.MonthlyCostAndIncomeList',
      '10': 'monthlyCostTrend'
    },
  ],
};

/// Descriptor for `GetMonthlyCostTrendResp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMonthlyCostTrendRespDescriptor = $convert.base64Decode(
    'ChdHZXRNb250aGx5Q29zdFRyZW5kUmVzcBJUChBtb250aGx5Q29zdFRyZW5kGAEgASgLMigucm'
    'VzdGF1cmFudF9ycGMuTW9udGhseUNvc3RBbmRJbmNvbWVMaXN0UhBtb250aGx5Q29zdFRyZW5k');
