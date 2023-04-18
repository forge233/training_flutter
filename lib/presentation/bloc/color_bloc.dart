import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_from_blocprovider/presentation/bloc/color_event.dart';
import 'package:counter_from_blocprovider/presentation/bloc/color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState(Colors.white)) {
    on<ColorChanged>(colorChangedToState);
  }

  void colorChangedToState(ColorChanged event, Emitter<ColorState> emit) {
    emit(state.copyWith(color: event.color));
  }

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event is ColorChanged) {
      yield ColorState(event.color);
    }
  }
}
