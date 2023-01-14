import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';

import '../navigation/routes.dart';

class FourthPage extends StatefulWidget {
  final SecondPageArgument secondPageArgument;

  const FourthPage({
    super.key,
    required this.secondPageArgument,
  });

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    widget.secondPageArgument;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorization'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Введите свой никнейм',
                ),
                keyboardType: TextInputType.name,
                validator: (text) {
                  final validNickname = RegExp(r'^[^A-z]');
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (widget.secondPageArgument.nickN != text) {
                    return 'Неверный логин';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите пароль'),
                maxLength: 20,
                obscureText: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (widget.secondPageArgument.pass != text) {
                    return 'Вы ввели неверный логин или пароль';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _onValidateAuth(context);
                },
                child: const Text(
                  'Авторизироваться',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onValidateAuth(BuildContext context) {
    final validAuth = _formKey.currentState!.validate();
    if (validAuth) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Вы успешно авторизировались'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(
        context,
        AppRoute.fivePage,
        arguments: SecondPageArgument(
          firstName: widget.secondPageArgument.firstName,
          lastName: widget.secondPageArgument.lastName,
          age: widget.secondPageArgument.age,
          nickN: widget.secondPageArgument.nickN,
          pass: widget.secondPageArgument.pass,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Не удалось войти в личный кабинет'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
