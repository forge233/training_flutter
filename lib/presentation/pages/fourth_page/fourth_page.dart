import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';

import '../../navigation/routes.dart';

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
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
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
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (widget.secondPageArgument.nickN != text) {
                    return 'Неверный логин';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _obscureText = !_obscureText);
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  border: const UnderlineInputBorder(),
                  labelText: 'Введите пароль',
                ),
                maxLength: 20,
                obscureText: _obscureText,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (widget.secondPageArgument.pass != text) {
                    return 'Вы ввели неверный логин или пароль';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20.0),
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
        arguments: widget.secondPageArgument,
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
