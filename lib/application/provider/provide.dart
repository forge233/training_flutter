import 'package:flutter/material.dart';


class CalculatorProvider with ChangeNotifier {
   double _result = 0.0;

  double get getResult => _result;

  void minus(String valueOne, String valueTwo) {
    _result = double.parse(valueOne) - double.parse(valueTwo);
    notifyListeners();
  }

  void plus(String valueOne, String valueTwo) {
    _result = double.parse(valueOne) + double.parse(valueTwo);
    notifyListeners();
  }

  void division(String valueOne, String valueTwo) {
    _result = double.parse(valueOne) * double.parse(valueTwo);
    notifyListeners();
  }

  void multiplication(String valueOne, String valueTwo) {
    _result = double.parse(valueOne) / double.parse(valueTwo);
    notifyListeners();
  }
}
