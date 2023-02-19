import 'dart:math';

import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int incrementCountOne = 0;
  int incrementCountTwo = 0;

  int get getIncrementTwo => incrementCountTwo;

  int get getIncrementOne => incrementCountOne;

  void plusValueOne() {
    incrementCountOne++;
    notifyListeners();
  }

  void plusValueTwo() {
    incrementCountTwo++;
    notifyListeners();
  }

  void minusValueOne() {
    incrementCountOne--;
    notifyListeners();
  }

  void minusValueTwo() {
    incrementCountTwo--;
    notifyListeners();
  }
}
