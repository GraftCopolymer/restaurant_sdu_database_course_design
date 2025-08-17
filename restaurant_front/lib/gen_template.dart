import 'package:flutter/material.dart';

class RouteTable {
  static final Map<String, WidgetBuilder> _table = {

  };

  static WidgetBuilder getByPath(String path) {
    return _table[path]!;
  }
}