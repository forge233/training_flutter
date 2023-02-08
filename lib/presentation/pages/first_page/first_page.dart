import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:forms_task/presentation/utils/validator.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController valueOne = TextEditingController();
  final TextEditingController valueTwo = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
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
                controller: valueOne,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите число 1'),
                keyboardType: TextInputType.number,
                validator: CheckValue.validatorForValue,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: valueTwo,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите число 2'),
                keyboardType: TextInputType.number,
                validator: CheckValue.validatorForValue,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _onValidate(context);
                          Provider.of<CalculatorProvider>(context,
                                  listen: false)
                              .minus(valueOne.text, valueTwo.text);
                        },
                        child: const Text('-')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _onValidate(context);
                          Provider.of<CalculatorProvider>(context,
                                  listen: false)
                              .plus(valueOne.text, valueTwo.text);
                        },
                        child: const Text('+')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _onValidate(context);
                          Provider.of<CalculatorProvider>(context,
                                  listen: false)
                              .multiplication(valueOne.text, valueTwo.text);
                        },
                        child: const Text('/')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _onValidate(context);
                          Provider.of<CalculatorProvider>(context,
                                  listen: false)
                              .division(valueOne.text, valueTwo.text);
                        },
                        child: const Text('*')),
                  ),
                ],
              ),
              Text(
                Provider.of<CalculatorProvider>(context).getResult.toString(),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
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
          content: Text('Успешно'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Неуспешно!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
