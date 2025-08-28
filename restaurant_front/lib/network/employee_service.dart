import 'package:restaurant_management/network/interceptor/auth_interceptor.dart';
import 'package:restaurant_management/network/rpc_service.dart';
import 'package:restaurant_management/src/generated/employee_service.pbgrpc.dart';

class EmployeeService {
  static final client = EmployeeServiceClient(RPCService.channel, interceptors: [
    AuthInterceptor()
  ]);
}