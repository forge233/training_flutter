import 'package:flutter/material.dart';

import '../models/book.dart';
import 'add_book/add_book.dart';
import 'detail_page/detail_page.dart';

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
              _navigatorDetails(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _navigatorTapOnButton();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _navigatorTapOnButton() async {
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
  }
  void _navigatorDetails(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book: booksList[index]),
      ),
    );
  }
}
