import 'dart:ui';

class ColorState {
  final Color color;

  ColorState(this.color);

  ColorState copyWith({Color? color}) {
    return ColorState(color ?? this.color);
  }
}