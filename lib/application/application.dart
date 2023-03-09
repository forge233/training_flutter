import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provider.dart';
import 'package:forms_task/presentation/pages/counter/counter_homepage.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: Builder(builder: (BuildContext context) {///TODO нащо тут Builder?
        return  MaterialApp(
          debugShowCheckedModeBanner: true,
          home: CounterHomePage(),
        );
      }),///TODO ...
    );
  }
}
