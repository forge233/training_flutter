import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provider.dart';
import 'package:forms_task/presentation/pages/counter/counter_homepage.dart';
import 'package:provider/provider.dart';

import '../presentation/provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        home: CounterHomePage(),
      ),
    );
  }
}
