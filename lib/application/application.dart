import 'package:flutter/material.dart';

import '../presentation/navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      initialRoute: AppRoute.firstPage,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
