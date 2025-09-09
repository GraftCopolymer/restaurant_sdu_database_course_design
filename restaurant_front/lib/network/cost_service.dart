import 'package:restaurant_management/network/interceptor/auth_interceptor.dart';
import 'package:restaurant_management/network/rpc_service.dart';
import 'package:restaurant_management/src/generated/cost_service.pbgrpc.dart';

class CostService {
  static final client = CostServiceClient(RPCService.channel, interceptors: [
    AuthInterceptor()
  ]);
}