import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static Future<String> read(String key, {String defaultValue = ""}) async {
    return await _storage.read(key: key) ?? defaultValue;
  }

  static Future<void> delete(String key) async {
    return _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    return _storage.deleteAll();
  }

  static Future<void> put(String key, String value) async {
    return _storage.write(key: key, value: value);
  }
}