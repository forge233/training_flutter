import 'package:api_makeup/presentation/navigation/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: AppRoutes.mainPage,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
