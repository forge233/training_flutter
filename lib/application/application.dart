import 'package:flutter/material.dart';

import '../presentation/pages/main_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CarouselTask(),
      );
    });
  }
}
