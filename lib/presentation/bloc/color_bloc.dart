import 'package:counter_from_blocprovider/presentation/bloc/color_event.dart';
import 'package:counter_from_blocprovider/presentation/bloc/color_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(Colors.white));

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event is ColorChanged) {
      final List<Color> colors = [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
        Colors.purple,
      ];
      final int currentIndex = colors.indexOf(state.color);
      yield ColorState(colors[(currentIndex + 1) % colors.length]);
    }
  }
}