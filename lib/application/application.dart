import 'package:flutter/material.dart';
import 'package:forms_task/presentation/pages/notebook/notebook_homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: NoteBook(),
    );
  }
}
