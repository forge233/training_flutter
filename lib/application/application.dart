import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_bloc.dart';
import 'package:to_do_list_from_bloc/presentation/pages/first_page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NoteBloc(),
      child: const MaterialApp(
        home: ToDoList(),
      ),
    );
  }
}
