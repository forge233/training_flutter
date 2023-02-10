import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int goodValue = 0;

  int get getGood => goodValue;
  int neutralValue = 0;

  int get getNeutral => neutralValue;
  int badValue = 0;

  int get getBad => badValue;
  int totalValue = 0;

  int get getTotal => totalValue;
  double percentageValue = 0;

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
