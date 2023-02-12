import 'package:flutter/material.dart';

import '../presentation/pages/future_pictures.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: FuturePic(),
    );
  }
}
