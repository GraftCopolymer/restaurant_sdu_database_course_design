import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:restaurant_management/network/auth_service.dart';
import 'package:restaurant_management/src/generated/basic_service.pbgrpc.dart';

@RoutePage()
class CostManagementPage extends StatefulWidget {
  const CostManagementPage({super.key});

  @override
  State<CostManagementPage> createState() => _CostManagementPageState();
}

class _CostManagementPageState extends State<CostManagementPage> {
  String? _token;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    AuthService.stub.login(LoginReq(
      username: "admin1",
      password: "123456"
    )).then((resp){
      if (mounted) {
        setState(() {
          _token = resp.accessToken;
          _isLoading = false;
        });
      }
    }).catchError((error) {
      if (error is GrpcError) {
        debugPrint("错误: ${(error).message}");
        setState(() {
          _token = error.message;
          _isLoading = false;
        });
      }
      else {
        debugPrint("未知错误: $error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("成本管理"),
      ),
      body: _isLoading ? 
        Center(
          child: CircularProgressIndicator(),
        ) :
        Center(
          child: Text("Token: $_token"),
        ),
    );
  }
}