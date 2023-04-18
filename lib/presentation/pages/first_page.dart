import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_from_blocprovider/presentation/bloc/color_bloc.dart';
import 'package:counter_from_blocprovider/presentation/bloc/color_state.dart';
import 'package:counter_from_blocprovider/presentation/bloc/color_event.dart';

class ColorChanger extends StatelessWidget {
  const ColorChanger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<ColorBloc>().state.color,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            title: const Text('Color Changer'),
          ),
          body: const Center(
            child: Text(
              'CLICK MENU',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                ListTile(
                  title: const Text('Red'),
                  onTap: () {
                    context.read<ColorBloc>().add(ColorChanged(Colors.red));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Green'),
                  onTap: () {
                    context.read<ColorBloc>().add(ColorChanged(Colors.green));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Blue'),
                  onTap: () {
                    context.read<ColorBloc>().add(ColorChanged(Colors.blue));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Yellow'),
                  onTap: () {
                    context.read<ColorBloc>().add(ColorChanged(Colors.yellow));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Purple'),
                  onTap: () {
                    context.read<ColorBloc>().add(ColorChanged(Colors.purple));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
