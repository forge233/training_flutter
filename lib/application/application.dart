import 'package:flutter/material.dart';

import '../presentation/pages/first_page/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WrapTest(),
        );
      }
  }
