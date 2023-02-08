import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:forms_task/presentation/pages/first_page/first_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return const MaterialApp(
            home: Calculator(),
          );
        },
      ),
    );
  }
}
