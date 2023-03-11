import 'package:flutter/material.dart';


class ColorProvider with ChangeNotifier {
  Color _color = Colors.blueGrey;

  Color get getColor => _color;

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
