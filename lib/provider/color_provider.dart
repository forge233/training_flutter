import 'package:flutter/material.dart';

///TODO provider не повинен находитись в application, почитай https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0
class ColorProvider with ChangeNotifier {
  Color _color = Colors.blueGrey;

  Color get setColor => _color;

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
