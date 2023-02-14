import 'package:flutter/material.dart';

class ProviderCounter with ChangeNotifier {
  int goodValue = 0;

  int neutralValue = 0;
  int badValue = 0;

  int totalValue = 0;

  double percentageValue = 0;

  int get getGood => goodValue;

  int get getNeutral => neutralValue;

  int get getBad => badValue;

  int get getTotal => totalValue;

  double get getPercent => percentageValue;

  void good() {
    goodValue++;

    notifyListeners();
  }

  void netural() {
    neutralValue++;
    notifyListeners();
  }

  void bad() {
    badValue++;
    notifyListeners();
  }

  void total() {
    totalValue = goodValue + neutralValue + badValue;
    notifyListeners();
  }

  void percentage() {
    percentageValue = goodValue + neutralValue / totalValue * 100;
    notifyListeners();
  }
}
