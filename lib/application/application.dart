import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_bloc.dart';

import '../presentation/bloc/notes_event.dart';
import '../presentation/pages/home_page/home_page.dart';


class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        NoteBloc noteBloc = NoteBloc();
        noteBloc.add(NoteLoadDataEvent());
        return noteBloc;
      },
      child: const MaterialApp(
        home: ToDoList(),
      ),
    );
  }
}


