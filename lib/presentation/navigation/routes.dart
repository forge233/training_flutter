import 'package:flutter/material.dart';
import 'package:photo_album/presentation/pages/home_page/home_page.dart';
import 'package:photo_album/presentation/pages/detail_page/detail_page.dart';

class AppRoutes {
  static const String mainPage = '/mainPage';
  static const String detailPage = '/detailPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case detailPage:
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            imageUrl: arguments as String,
            altDescription: arguments,
            bio: arguments,
            description: arguments,
            heroId: arguments,
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
