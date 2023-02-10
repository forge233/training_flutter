import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:forms_task/presentation/pages/feedback_counter/feedback_counter.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: Builder(
        builder: (BuildContext context) {
          return  const MaterialApp(
            home: FeedbackCounter(),
          );
        },
      ),
    );
  }
}
