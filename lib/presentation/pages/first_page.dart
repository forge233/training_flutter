import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/color_bloc.dart';
import '../bloc/color_event.dart';
import '../bloc/color_state.dart';

class ColorChanger extends StatelessWidget {
  const ColorChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<ColorBloc>().state.color,
          appBar: AppBar(
            title: const Text('Color Changer'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ColorChanged());
              },
              child: const Text('Change Color'),
            ),
          ),
        );
      }),
    );
  }
}
