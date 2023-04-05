import 'package:api_makeup/presentation/navigation/model_arguments/model_arguments.dart';
import 'package:api_makeup/presentation/pages/details_page/detail_page.dart';
import 'package:api_makeup/presentation/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String mainPage = '/mainPage';
  static const String detailPage = '/detailPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/mainPage':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      case '/detailPage':
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            secondPageArguments: arguments as SecondPageArguments,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('NOT FOUND!')),
          ),
        );
    }
  }
}
