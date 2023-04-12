
import 'package:flutter/material.dart';

import '../presentation/pages/main_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: StreamPractice(),
    );
  }
}
