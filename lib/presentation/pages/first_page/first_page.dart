import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_bloc.dart';
import 'package:to_do_list_from_bloc/presentation/settings/date.dart';
import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';
import 'package:to_do_list_from_bloc/presentation/pages/second_page/second_page.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_event.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_state.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  ToDoListState createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Усі нотатки',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 23.0,
                    color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.arrow_downward_outlined),
                        title: const Text('Sort'),
                        onTap: () {
                          setState(() {
                            state.notes
                                .sort((a, b) => a.date.compareTo(b.date));
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.arrow_upward_outlined),
                        title: const Text('Sort'),
                        onTap: () {
                          setState(() {
                            state.notes
                                .sort((a, b) => b.title.compareTo(a.title));
                          });
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
              ),
            ),
            body: ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          noteTitle: note.title,
                          noteContent: note.content,
                          noteId: note.noteId,
                        ),
                      ),
                    ).then((updatedNote) {
                      if (updatedNote != null) {
                        context
                            .read<NoteBloc>()
                            .add(NoteUpdateEvent(updatedNote));

                        setState(() {
                          state.notes[state.notes.indexOf(note)] = updatedNote;
                        });
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatter.format(note.date),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            note.content,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String newNoteTitle = '';
                    String newNoteContent = '';
                    return AlertDialog(
                      title: const Text('Новая заметка'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  newNoteTitle = value;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Введите название заметки',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                style: const TextStyle(height: 1.4),
                                maxLines: 11,
                                onChanged: (content) {
                                  newNoteContent = content;
                                },
                                decoration: const InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintText: 'Введите текст заметки'),
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async {
                              final newNote = Note(
                                title: newNoteTitle,
                                content: newNoteContent,
                                noteId: const Uuid().v4(),
                              );
                              context
                                  .read<NoteBloc>()
                                  .add(NoteAddEvent(newNote));
                              Navigator.of(context).pop();
                            },
                            child: const Text('Добавить'))
                      ],
                    );
                  },
                );
              },
              child: const Icon(
                Icons.edit_note_outlined,
                color: Colors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}
