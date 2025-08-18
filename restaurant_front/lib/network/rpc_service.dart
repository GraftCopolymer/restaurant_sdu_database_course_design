import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/constants.dart';

class RPCService {
  static final channel = ClientChannel(
    serverAddress,
    port: serverPort,
    options: ChannelOptions(credentials: ChannelCredentials.insecure())
  );
}