import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static Future<void> setValue(int count) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setInt('valueOfCount', count);
  }

  static Future<int?> getValue() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getInt('valueOfCount');
  }

  static Future<void> removeValue() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.remove('valueOfCount');
  }
}
