import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static String sharedDomain =
      "https://second-food-door-default-rtdb.firebaseio.com";
  static saveBoolData(String key, bool value) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    _shared.setBool(key, value);
  }

  static getBoolData(String key) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    bool? isValid = _shared.getBool(key);
    return isValid;
  }
}
