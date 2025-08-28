import 'package:uuid/uuid.dart';

class UUIDs {
  static final uuid = Uuid();

  static String v1() => uuid.v1();
}