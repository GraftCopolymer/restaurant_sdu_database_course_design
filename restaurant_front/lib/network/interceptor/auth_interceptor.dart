import 'package:grpc/grpc.dart';

class AuthInterceptor extends ClientInterceptor {
  String _token;
  AuthInterceptor(this._token);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    // 添加用户token
    final optionsWithToken = options.mergedWith(
      CallOptions(
        metadata: {
          'authorization': _token
        }
      )
    );
    return invoker(method, request, optionsWithToken);
  }

}