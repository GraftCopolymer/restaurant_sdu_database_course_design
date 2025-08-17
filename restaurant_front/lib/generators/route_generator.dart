import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:restaurant_management/annotations/route_page.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';

const String OUT_PATH = "lib/generated/route_table.dart";

class RouteGenerator extends GeneratorForAnnotation<RoutePage> {
  final TypeChecker _widgetChecker = TypeChecker.fromUrl(
    'asset:flutter/lib/src/widgets/framework.dart#Widget'
  );
  // 已解析的路径缓存
  final Map<String, String> _parsedPath = {};
  bool _isInit = false;
  static bool hasError = false;

  Future<void> _init(BuildStep buildStep) async {
    _isInit = true;
    // AssetId id = AssetId(buildStep.inputId.package, OUT_PATH);
    // 检测生成文件是否存在
    final generatedFile = File(OUT_PATH);
    if (!generatedFile.existsSync()) return;
    // 读取已生成的路由文件, 加载进_parsedPath中
    final generatedString = await generatedFile.readAsString();
    final lines = generatedString.split('\n');
    bool foundStart = false;
    bool foundEnd = false;
    int startIndex = 0;
    int endIndex = 0;
    for (int index = 0; index < lines.length; index++) {
      if (foundStart && foundEnd) break;
      if (!foundStart && lines[index].contains('static final Map<String, WidgetBuilder> _table = {')) {
        startIndex = index;
        foundStart = true;
      }
      if (!foundEnd && index > startIndex && lines[index].contains("};")) {
        endIndex = index;
        foundEnd = true;
      }
    }
    String pathStartPattern = '"/';
    String widgetStartPattern = '=> ';
    for (int lineIndex = startIndex + 1; lineIndex < endIndex; lineIndex++) {
      String line = lines[lineIndex].trim();
      log.warning("当前处理行: $line");
      int pathIndexStart = line.indexOf(pathStartPattern);
      if (pathIndexStart == -1) continue;
      int pathIndexEnd = line.indexOf('"', pathIndexStart + 1);
      if (pathIndexEnd == -1) continue;
      print("startIndex: $pathIndexStart, endIndex: $pathIndexEnd");
      // 获取路径名称
      String pathName = line.substring(pathIndexStart + 1, pathIndexEnd);
      // 获取页面名称
      int widgetStartIndex = line.indexOf(widgetStartPattern, pathIndexStart);
      if (widgetStartIndex == -1) continue;
      int widgetEndIndex = line.indexOf('),', widgetStartIndex);
      if (widgetEndIndex == -1) continue;
      String widgetName = line.substring(widgetStartIndex + widgetStartPattern.length, widgetEndIndex - 1);
      // 存入_parsedPath
      _parsedPath[pathName] = widgetName;
    }

    _parsedPath.forEach((key, value) {
      log.warning("路由entry: $key: $value");
    });
  }

  @override
  Future<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (!_isInit) await _init(buildStep);
    if (element is! ClassElement) {
      throw StateError("${element.displayName} is not a class!");
    }
    final clazz = element as ClassElement;
    if (!_isWidgetSubclass(clazz)) {
      throw StateError("${element.displayName} is not a Widget!");
    }
    log.info("Generating route for ${clazz.name}");
    String path = annotation.read('path').stringValue;
    if (!path.startsWith("/")) {
      path = '/$path';
    }
    if (_parsedPath.containsKey(path)) {
      hasError = true;
      throw StateError("Error while generate route entry for ${clazz.name}, because ${_parsedPath[path]} already declared path \"$path\"");
    }
    final desc = annotation.read('desc').isNull ? null : annotation.read('desc').stringValue.trim();
    final buffer = StringBuffer()
      ..writeln('import "${buildStep.inputId.uri.toString()}"')
      ..writeln('"$path": (context) => ${clazz.name}()');
    if (desc != null && desc.isNotEmpty) {
      buffer.writeln(desc);
    }
    _parsedPath[path] = clazz.name;
    return buffer.toString();
  }

  /// 检查传入的类是否是Widget的子类
  bool _isWidgetSubclass(ClassElement clazz) {
    // 检查是否直接是Widget类
    if (_widgetChecker.isExactlyType(clazz.thisType)) {
      return true;
    }
    // 检查是否是Widget的子类
    InterfaceType? interfaceType = clazz.supertype;
    InterfaceType? type = interfaceType;
    while (type != null) {
      if (_widgetChecker.isExactlyType(type)){
        return true;
      }
      type = type.superclass;
      if (type == interfaceType) {
        throw StateError("Circular inheritance detected!");
      }
    }
    return false;
  }
}

class RouteAssembleBuilder implements Builder {
  final String target_file;

  const RouteAssembleBuilder({this.target_file = "main.dart"});

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    if (RouteGenerator.hasError) {
      log.severe("Error occurred in RouteGenerator, stop assembling");
      return;
    }
    final cachedFiles = await buildStep.findAssets(Glob("**/*.route")).toList();
    final buffer = StringBuffer()
      ..writeln("// Generated file, DO NOT EDIT!")
      ..writeln("// Generated by GraftCopolymer's RouteGenerator")
      ..writeln();
    final importBuffer = StringBuffer()
      ..writeln("import 'package:flutter/material.dart';");
    final routeEntryBuffer = StringBuffer();

    for (AssetId assetId in cachedFiles) {
      final routeFile = await buildStep.readAsString(assetId);
      List<String> lines = routeFile.split('\n');
      // 第 7 行是必要的导入语句, 保证生成的代码中的类都能正常定位
      importBuffer.writeln(lines[6]);
      // 第 9 行是路由描述
      final desc = lines[8] == '' ? null : lines[8];
      // 第 8 行是该项的路由代码
      routeEntryBuffer.writeln('    ${lines[7]}, ${desc == null ? "" : "// $desc"}');
      log.warning("package name: ${buildStep.inputId.uri}");
    }

    buffer
      ..writeln(importBuffer.toString())
      ..writeln()
      ..writeln('class RouteTable {')
      ..writeln(' static final Map<String, WidgetBuilder> _table = {')
      ..writeln(routeEntryBuffer.toString())
      ..writeln(' };')
      ..writeln(' static WidgetBuilder getByPath(String path) {')
      ..writeln('   return _table[path]!;')
      ..writeln(' }')
      ..writeln('}');
    AssetId targetAssetId = AssetId(buildStep.inputId.package, 'lib/generated/route_table.dart');
    await buildStep.writeAsString(targetAssetId, buffer.toString());
  }

  @override
  Map<String, List<String>> get buildExtensions => {r'lib/$lib$': [OUT_PATH]};
}