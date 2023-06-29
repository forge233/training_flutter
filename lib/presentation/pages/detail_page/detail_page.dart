import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_from_bloc/application/storage/storage.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_bloc.dart';
import 'package:to_do_list_from_bloc/presentation/bloc/notes_event.dart';
import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';

class DetailPage extends StatefulWidget {
  final String noteTitle;
  final String noteContent;
  final String noteId;

  const DetailPage({
    Key? key,
    required this.noteTitle,
    required this.noteContent,
    required this.noteId,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteTitle);
    _contentController = TextEditingController(text: widget.noteContent);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigateToHomePage();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: _navigateToHomePage,
            icon: const Icon(Icons.arrow_back),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Редактирование'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Заголовок',
                            ),
                            style: const TextStyle(fontSize: 20.0),
                          ),
                          const SizedBox(height: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: _contentController,
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Текст заметки',
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: const Text('Сохранить'))
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () async {
                DeviceStorage.removeData();
                BlocProvider.of<NoteBloc>(context)
                    .add(NoteDeleteEvent(widget.noteId));
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                _titleController.text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                _contentController.text,
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHomePage() {
    final infoNote = Note(
      title: _titleController.text,
      content: _contentController.text,
      noteId: widget.noteId,
    );
    Navigator.of(context).pop(infoNote);
  }
}
