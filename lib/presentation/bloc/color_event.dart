import 'dart:ui';

abstract class ColorEvent {}

class ColorChanged extends ColorEvent {
  final Color color;

  ColorChanged(this.color);
}
