import 'package:flutter/material.dart';
import 'package:forms_task/presentation/first_page/first_page.dart';
import 'package:forms_task/presentation/five_page/five_page.dart';
import 'package:forms_task/presentation/fourth_page/fourth_page.dart';
import 'package:forms_task/presentation/third_page/third_page.dart';
import '../second_page/second_page.dart';
import 'model_arguments/page_arguments.dart';

class AppRoute {
  static const String firstPage = '/firstPage';
  static const String secondPage = '/secondPage';
  static const String thirdPage = '/thirdPage';
  static const String fourthPage = '/fourthPage';
  static const String fivePage = '/fivePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/firstPage':
        return MaterialPageRoute(
          builder: (_) => const FirstPage(),
        );
      case '/secondPage':
        return MaterialPageRoute(
          builder: (_) => SecondPage(),
        );
      case '/thirdPage':
        return MaterialPageRoute(
          builder: (_) => ThirdPage(
            secondPageArgument: arguments as SecondPageArgument,
          ),
        );
      case '/fourthPage':
        return MaterialPageRoute(
          builder: (_) => FourthPage(
            secondPageArgument: arguments as SecondPageArgument,
          ),
        );
      case '/fivePage':
        return MaterialPageRoute(
          builder: (_) => FivePage(
            secondPageArgument: arguments as SecondPageArgument,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
