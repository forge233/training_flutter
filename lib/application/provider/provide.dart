import 'package:flutter/material.dart';
///TODO класс повинен називатись так як називаєтся файл
///TODO що таке provide чи Changer ? Погана назва, краще щось типу color_provider
///TODO provider не повинен находитись в application, почитай https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0
class Changer with ChangeNotifier {
  Color _color = Colors.blueGrey;

  Color get setColor => _color;

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }
}
