import 'package:flutter/material.dart';

class Book {
  String title;
  String author;
  String publisher;

  Book({required this.title, required this.author, required this.publisher});
}

class BooksListPage extends StatefulWidget {
  const BooksListPage({Key? key}) : super(key: key);

  @override
  _BooksListPageState createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  List<Book> booksList = [
    Book(title: 'Місто', author: 'Елеонора Ліпска', publisher: 'Крок'),
    Book(
        title: 'Таємниця країни балок',
        author: 'Марія Літун',
        publisher: 'А-ба-ба-га-ла-ма'),
    Book(
        title: 'Атлас хмар',
        author: 'Девід Мітчелл',
        publisher: 'Клуб сімейного дому'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список книг'),
      ),
      body: ListView.builder(
        itemCount: booksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(booksList[index].title),
            subtitle: Text(
                '${booksList[index].author}, ${booksList[index].publisher}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(book: booksList[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBookPage(),
            ),
          );
          if (result != null) {
            setState(() {
              booksList.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Автор: ${book.author}'),
            Text('Видавництво: ${book.publisher}'),
          ],
        ),
      ),
    );
  }
}

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
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
        title: const Text('Додати книгу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Назва книги'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Будь ласка, введіть назву книги';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Автор'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Будь ласка, введіть автора книги';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publisherController,
                decoration: const InputDecoration(labelText: 'Видавництво'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Будь ласка, введіть видавництво книги';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newBook = Book(
                      title: _titleController.text,
                      author: _authorController.text,
                      publisher: _publisherController.text,
                    );
                    Navigator.pop(context, newBook);
                  }
                },
                child: const Text('Додати'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
