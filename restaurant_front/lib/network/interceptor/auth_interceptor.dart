import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/auth_service.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';
import 'package:restaurant_management/utils/secure_storage_utils.dart';
import 'package:restaurant_management/utils/store_keys.dart';
import 'package:restaurant_management/utils/utils.dart';

class AuthInterceptor extends ClientInterceptor {
  AuthInterceptor();

  FutureOr<void> _provider(Map<String, String> metadata, String uri) async {
    final accessToken = await SecureStorage.read(StoreKeys.accessToken);
    // TODO: 需要实现刷新token
    // if (Utils.isJwtExpired(accessToken)) {
    //   // 刷新 token
    //   final refreshReq = RefreshTokenReq(
    //     refreshToken: await SecureStorage.read(StoreKeys.refreshToken)
    //   );
    //   try {
    //     final resp = await AuthService.client.refreshToken(refreshReq);
    //   } on GrpcError catch(e) {
        
    //   }
    // }
    
    // 添加用户token
    metadata['authorization'] = "Bearer $accessToken";
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(ClientMethod<Q, R> method, Q request, CallOptions options, ClientUnaryInvoker<Q, R> invoker) {
    final optionsWithToken = options.mergedWith(
      CallOptions(
        providers: [_provider]
      )
    );
    return invoker(method, request, optionsWithToken);
  }

}