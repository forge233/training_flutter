import 'package:flutter/material.dart';
import 'package:map_practice/presentation/pages/map_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BooksListPage(),
    );
  }
}
