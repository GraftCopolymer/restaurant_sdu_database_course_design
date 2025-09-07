import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management/providers/user_info_provider.dart';

class LoginScope extends ConsumerStatefulWidget {
  const LoginScope({super.key, required this.onLogin, required this.onError, required this.onLoading});

  final Widget Function(BuildContext context, UserInfo userInfo) onLogin;
  final Widget Function(BuildContext context, Object e, StackTrace stackTrace) onError;
  final Widget Function(BuildContext context) onLoading;

  @override
  ConsumerState<LoginScope> createState() => _LoginScopeState();
}

class _LoginScopeState extends ConsumerState<LoginScope> {
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoModelProvider);
    return userInfo.when(data: (userInfo){
      return widget.onLogin.call(context,userInfo);
    }, error: (e,s) {
      return widget.onError.call(context,e,s);
    }, loading: () => widget.onLoading(context));
  }
}