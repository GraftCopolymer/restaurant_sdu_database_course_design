import 'package:restaurant_management/network/rpc_service.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';

class AuthService {
  static final AuthServiceClient stub = AuthServiceClient(RPCService.channel);
}