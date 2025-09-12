// This is a generated file - do not edit.
//
// Generated from file_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use uploadImageRequestDescriptor instead')
const UploadImageRequest$json = {
  '1': 'UploadImageRequest',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 12, '10': 'chunk'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
  ],
};

/// Descriptor for `UploadImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageRequestDescriptor = $convert.base64Decode(
    'ChJVcGxvYWRJbWFnZVJlcXVlc3QSFAoFY2h1bmsYASABKAxSBWNodW5rEhsKCWZpbGVfbmFtZR'
    'gCIAEoCVIIZmlsZU5hbWU=');

@$core.Deprecated('Use uploadImageResponseDescriptor instead')
const UploadImageResponse$json = {
  '1': 'UploadImageResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `UploadImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadImageResponseDescriptor = $convert.base64Decode(
    'ChNVcGxvYWRJbWFnZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2'
    'FnZRgCIAEoCVIHbWVzc2FnZRIQCgN1cmwYAyABKAlSA3VybA==');
