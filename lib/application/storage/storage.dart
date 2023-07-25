import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static const String _visibilityKey = 'currencyVisibility';
  static const String _orderKey = 'currencyOrder';

  static Future<void> saveCurrencyVisibility(bool visibility) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_visibilityKey, visibility);
  }


  static Future<bool> loadCurrencyVisibility() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? visibility = prefs.getBool(_visibilityKey);
    return visibility ?? true;
  }

  static Future<void> saveCurrencyOrder(int order) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_orderKey, order);
  }

  static Future<int> loadCurrencyOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? order = prefs.getInt(_orderKey);
    return order ?? 0;
  }
}
