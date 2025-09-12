import 'package:restaurant_management/network/rpc_service.dart';
import 'package:restaurant_management/src/generated/file_service.pbgrpc.dart';

class FileService {
  static final FileServiceClient client = FileServiceClient(RPCService.channel);
}