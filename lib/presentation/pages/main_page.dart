import 'package:flutter/material.dart';
import 'package:map_practice/presentation/pages/add_book.dart';
import 'package:map_practice/presentation/pages/detail_page.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Map<String, Map<String, String>> bookList = {
    'Місто': {
      'author': 'Елеонора Ліпска',
      'publisher': 'Крок',
    },
    'Таємниця країни балок': {
      'author': 'Марія Літун',
      'publisher': 'А-ба-ла-гу-м',
    },
    'Атлас хмар': {
      'author': 'Девід Мітчел',
      'publisher': 'Клуб сімейного дому',
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookList.keys.elementAt(index)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    bookDetails: bookList.values.elementAt(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookPage(bookList: bookList),
            ),
          );
          if (newBook != null) {
            setState(() {
              bookList.addAll(newBook);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

