import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key, required this.bookList}) : super(key: key);

  final Map<String, Map<String, String>> bookList;

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _publisherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Назва книги',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Введіть будь-ласка назву';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Введіть автора',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Введіть будь-ласка автора';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publisherController,
                decoration: const InputDecoration(
                  labelText: 'Введіть видавництво',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Введіть будь-ласка видавництво';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newBook = {
                      _titleController.text: {
                        'author': _authorController.text,
                        'publisher': _publisherController.text,
                      },
                    };
                    Navigator.pop(context, newBook);
                  }
                },
                child: const Text('Додати книгу'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
