import 'package:flutter/cupertino.dart';

class CounterProvide extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  void addCount() {
    _counter++;
    notifyListeners();
  }

  void minusCount() {
    _counter--;
    notifyListeners();
  }
}
