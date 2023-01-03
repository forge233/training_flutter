import 'package:flutter/material.dart';

import '../presentation/first_page/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  ///TODO комент удали и не копируй код
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}