import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'First Page', ///TODO Не нужна ,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          ///TODO если анонимная функция больше 5 строк, выносим в отдельный метод
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoute.secondPage,
            );
          },
          child: const Text(
            'Перейти к регистрации',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
