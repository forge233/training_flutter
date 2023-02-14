import 'package:flutter/material.dart';

class ProviderOfCounter with ChangeNotifier {

  int count = 0;

  int get getCountPlus => count;

  void plus() {
    count++;
    notifyListeners();
  }

  void minus() {
    count--;
    notifyListeners();
  }
}
