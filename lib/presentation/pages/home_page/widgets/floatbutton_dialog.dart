import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../bloc/notes_bloc.dart';
import '../../../bloc/notes_event.dart';
import '../../../navigation/model_arguments/models.dart';

class FloatButtonDialog extends StatefulWidget {
  const FloatButtonDialog({super.key});

  @override
  State<FloatButtonDialog> createState() => _FloatButtonDialogState();
}

class _FloatButtonDialogState extends State<FloatButtonDialog> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        titleController.clear();
        contentController.clear();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Новая заметка'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Введите название заметки',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        controller: contentController,
                        style: const TextStyle(height: 1.4),
                        maxLines: 11,
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
                        title: titleController.text,
                        content: contentController.text,
                        noteId: const Uuid().v4(),
                      );
                      context.read<NoteBloc>().add(NoteAddEvent(newNote));
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
    );
  }
}
