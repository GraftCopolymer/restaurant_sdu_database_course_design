import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/constants.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';

class AuthService {
  static final channel = ClientChannel(
    serverAddress,
    port: serverPort,
    options: ChannelOptions(credentials: ChannelCredentials.insecure())
  );

  static final AuthServiceClient stub = AuthServiceClient(channel);
}