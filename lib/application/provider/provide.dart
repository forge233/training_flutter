import 'package:flutter/cupertino.dart';
///TODO ...
class Counter with ChangeNotifier {
  int goodValue = 0;///TODO незрозуміла назва, раджу глянути https://youtu.be/5vsfYifNqzk


  ///TODO спочатку поля классу потім вже гетери класу
  
  int get getGood => goodValue;///TODO незрозуміла назва
  int neutralValue = 0;

  int get getNeutral => neutralValue;///TODO незрозуміла назва
  int badValue = 0;///TODO незрозуміла назва

  int get getBad => badValue;///TODO незрозуміла назва
  int totalValue = 0;///TODO незрозуміла назва

  int get getTotal => totalValue;///TODO незрозуміла назва
  double percentageValue = 0;///TODO незрозуміла назва

  double get getPercent => percentageValue;///TODO незрозуміла назва

  void good() {///TODO незрозуміла назва
    goodValue++;///TODO незрозуміла назва
    notifyListeners();
  }

  void netural() {///TODO незрозуміла назва
    neutralValue++;
    notifyListeners();
  }

  void bad() {///TODO незрозуміла назва
    badValue++;
    notifyListeners();
  }

  void total() {///TODO незрозуміла назва
    totalValue = goodValue + neutralValue + badValue;
    notifyListeners();
  }

  void percentage() {///TODO незрозуміла назва
    percentageValue = goodValue + neutralValue / totalValue * 100;
    notifyListeners();
  }
}
