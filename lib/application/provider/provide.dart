import 'package:flutter/material.dart';

class Changer with ChangeNotifier {
  Color _color = Colors.blueGrey;

  Color get setColor => _color;

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
