import 'package:shared_preferences/shared_preferences.dart';

class SP {
  static bool _init = false;
  static late final SharedPreferences _pref;

  static Future<void> init() async {
    if (!_init) {
      _init = true;
      _pref = await SharedPreferences.getInstance();
    }
  }

  static SharedPreferences get pref => _pref;
}