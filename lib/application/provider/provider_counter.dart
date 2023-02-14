import 'package:flutter/material.dart';

class ProviderCounter with ChangeNotifier {
  int goodCountFeedback = 0;

  int neutralCountFeedback = 0;
  int badCountFeedback = 0;

  int totalCountFeedback = 0;

  double percentageCountFeedback = 0;

  int get getGood => goodCountFeedback;

  int get getNeutral => neutralCountFeedback;

  int get getBad => badCountFeedback;

  int get getTotal => totalCountFeedback;

  double get getPercent => percentageCountFeedback;

  void good() {
    goodCountFeedback++;

    notifyListeners();
  }

  void netural() {
    neutralCountFeedback++;
    notifyListeners();
  }

  void bad() {
    badCountFeedback++;
    notifyListeners();
  }

  void total() {
    totalCountFeedback = goodCountFeedback + neutralCountFeedback + badCountFeedback;
    notifyListeners();
  }

  void percentage() {
    percentageCountFeedback = goodCountFeedback + neutralCountFeedback / totalCountFeedback * 100;
    notifyListeners();
  }
}
