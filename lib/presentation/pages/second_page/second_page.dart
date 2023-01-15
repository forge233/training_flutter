import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';
import 'package:forms_task/presentation/navigation/routes.dart';
import 'package:forms_task/presentation/pages/utils/app_validator.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _obscureText = true;

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
                  AppValidator.validatorForNickName(text);
                  return null;
                },
              ),
              TextFormField(
                controller: _firstName,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Введите свое имя',
                ),
                keyboardType: TextInputType.name,
                validator: (text) {
                  AppValidator.validatorForFirstName(text);
                  return null;
                },
              ),
              TextFormField(
                controller: _lastName,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите свою фамилию'),
                validator: (text) {
                  AppValidator.validatorForLastName(text);
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Введите свой возраст',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  AppValidator.validatorForAge(value);
                  return null;
                },
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _obscureText = !_obscureText);
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: const UnderlineInputBorder(),
                  labelText: 'Придумайте пароль',
                ),
                maxLength: 20,
                obscureText: _obscureText,
                validator: (text) {
                  AppValidator.validatorForPassword(text);
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _onValidate(context),
                child: const Text(
                  'Завершить регистрацию',
                  style: TextStyle(color: Colors.white),
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
