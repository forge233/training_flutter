import 'package:flutter/material.dart';
import 'package:map_practice/presentation/pages/main_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: BookPage(),
    );
  }
}
