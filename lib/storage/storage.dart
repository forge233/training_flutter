import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static Future<void> setText(String text) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString('enterText', text);
  }

  static Future<String?> getText() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString('enterText');
  }
}