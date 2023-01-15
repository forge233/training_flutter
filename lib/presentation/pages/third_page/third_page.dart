import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/routes.dart';

import '../../navigation/model_arguments/page_arguments.dart';

class ThirdPage extends StatelessWidget {
  final SecondPageArgument secondPageArgument;

  const ThirdPage({
    super.key,
    required this.secondPageArgument,
  });

  @override
  Widget build(BuildContext context) {
    secondPageArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ending Registration'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вы успешно прошли регистрацию!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(
              height: 20.0
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.fourthPage,
                  arguments: secondPageArgument,
                );
              },
              child: const Text(
                'Авторизироваться',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
