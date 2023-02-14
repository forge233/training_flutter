import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:provider/provider.dart';

import '../presentation/pages/counter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOfCounter(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            home: CounterData(
              count: Provider.of<ProviderOfCounter>(context).count,
            ),
          );
        },
      ),
    );
  }
}
