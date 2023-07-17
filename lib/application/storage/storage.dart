import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  static const String _visibilityKey = 'currencyVisibility';
  static const String _orderKey = 'currencyOrder';

  static Future<List<bool>> loadCurrencyVisibility(int length) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? visibilityJson = prefs.getString(_visibilityKey);
    if (visibilityJson != null) {
      List<dynamic> visibilityData = jsonDecode(visibilityJson);
      List<bool> visibility =
          visibilityData.map((value) => value as bool).toList();
      if (visibility.length == length) {
        return visibility;
      }
    }
    return List<bool>.filled(length, true);
  }

  static Future<List<int>> loadCurrencyOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? orderJson = prefs.getString(_orderKey);
    if (orderJson != null) {
      List<dynamic> orderData = jsonDecode(orderJson);
      List<int> order = orderData.map((value) => value as int).toList();
      return order;
    }
    return [];
  }

  static Future<void> saveCurrencyVisibility(List<bool> visibility) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String visibilityJson = jsonEncode(visibility);
    await prefs.setString(_visibilityKey, visibilityJson);
  }

  static Future<void> saveCurrencyOrder(List<int> order) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String orderJson = jsonEncode(order);
    await prefs.setString(_orderKey, orderJson);
  }
}
