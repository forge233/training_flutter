import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';
import 'package:forms_task/presentation/navigation/routes.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _nickName = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
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
                controller: _nickName,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Введите свой никнейм',
                ),
                keyboardType: TextInputType.name,
                validator: (text) {
                  final validNickname = RegExp(r'^[^A-z]');
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (validNickname.hasMatch(text)) {
                    return 'С заглавном буквы латиницой';
                  } else if (text.length < 4) {
                    return 'Не менее 4х символов';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstName,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите свое имя'),
                keyboardType: TextInputType.name,
                validator: (text) {
                  final validName = RegExp(r'^[^А-Яа-яЁё]');
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (validName.hasMatch(text)) {
                    return 'Только кирилица';
                  } else if (text.length < 4) {
                    return 'Не менее 4х символов';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastName,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите свою фамилию'),
                validator: (text) {
                  final validLastname = RegExp(r'^[^А-Яа-яЁё]');
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (validLastname.hasMatch(text)) {
                    return 'Только кирилица';
                  } else if (text.length < 4) {
                    return 'Не менее 4х символов';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите свой возраст'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final ageValid = RegExp(r'^[^0-9]');
                  if (value == null || value.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (ageValid.hasMatch(value)) {
                    return 'Только числа';
                  } else if (value.length < 2) {
                    return 'Не более 2х символов';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Придумайте пароль',
                ),
                maxLength: 20,
                obscureText: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Поле не может быть пустым';
                  } else if (text.length < 8) {
                    return 'Пароль должен быть не менее 8 символов';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _onValidate(context);
                },
                child: const Text(
                  'Завершить регистрацию',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onValidate(BuildContext context) {
    final valid = _formKey.currentState!.validate();
    if (valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Данные прошли'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(
        context,
        AppRoute.thirdPage,
        arguments: SecondPageArgument(
          nickN: _nickName.text,
          pass: _password.text,
          firstName: _firstName.text,
          lastName: _lastName.text,
          age: _ageController.text,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Данные не прошли'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class User {
  final int age;

  User(this.age);
}

void calc() {
  User user;
}
