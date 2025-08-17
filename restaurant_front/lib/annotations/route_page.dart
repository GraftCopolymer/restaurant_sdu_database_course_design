import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class RoutePage {
  /// 路由路径, 必须唯一
  final String path;
  /// 路由描述, 将生成在路由表中
  final String? desc;
  const RoutePage({required this.path, this.desc});
}