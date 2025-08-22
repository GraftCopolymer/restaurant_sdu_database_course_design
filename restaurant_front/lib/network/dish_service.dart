import 'package:restaurant_management/network/interceptor/auth_interceptor.dart';
import 'package:restaurant_management/network/rpc_service.dart';
import 'package:restaurant_management/src/generated/dish_service.pbgrpc.dart';

class DishService {
  static final DishServiceClient client = DishServiceClient(RPCService.channel, interceptors: [
    AuthInterceptor()
  ]);
}