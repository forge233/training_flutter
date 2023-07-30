import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dot/result.dart';

class DeviceStorage {
  static const String _visibilityKey = 'currencyVisibility';
  static const String _orderKey = 'currencyOrder';

  static Future<void> saveCurrencyVisibility(List<bool> visibility) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> parsedVisibility = [];
    for (bool visible in visibility) {
      if (visible) {
        parsedVisibility.add('1');
      } else {
        parsedVisibility.add('0');
      }
    }
    await prefs.setStringList(_visibilityKey, parsedVisibility);
  }

  static Future<List<bool>> loadCurrencyVisibility() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? visibility = prefs.getStringList(_visibilityKey);
    List<bool> parsedVisibility = [];

    if (visibility != null) {
      for (String element in visibility) {
        if (element == '1') {
          parsedVisibility.add(true);
        } else {
          parsedVisibility.add(false);
        }
      }
    }
    return parsedVisibility;
  }

  static Future<void> saveCurrencyOrder(List<String> currencyOrder) async {
    print("Saving currency order: $currencyOrder");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_orderKey, currencyOrder);
  }

  static Future<List<String>> loadCurrencyOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? orderStringList = prefs.getStringList(_orderKey);
    List<String> order = orderStringList ?? [];
    print("Loaded currency order: $order");
    return order;
  }
}
