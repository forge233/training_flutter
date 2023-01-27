import 'package:flutter/material.dart';
import 'package:forms_task/application/provide/counter.dart';
import 'package:provider/provider.dart';

import '../presentation/pages/first_page/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvide(),
      child: Builder(builder: (BuildContext context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: true,
          home: HomePage(),
        );
      }),
    );
  }
}
