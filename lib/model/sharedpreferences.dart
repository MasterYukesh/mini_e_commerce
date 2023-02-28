import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences {
  static SharedPreferences? sp;
  static Future init() async {
    sp = await SharedPreferences.getInstance();
  }

  static Future setUserId(String id) async {
    await sp?.setString('UserID', id);
  }

  static Future<String> getUserId() async {
    return sp?.getString('UserID') ?? "";
  }

  static void clear() {
    sp?.clear();
  }
}
