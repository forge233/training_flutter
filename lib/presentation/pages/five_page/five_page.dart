import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';

class FivePage extends StatelessWidget {
  final SecondPageArgument secondPageArgument;

  const FivePage({
    super.key,
    required this.secondPageArgument,
  });

  @override
  Widget build(BuildContext context) {
    secondPageArgument;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reg. info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your info:',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              secondPageArgument.nickN,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              secondPageArgument.firstName,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              secondPageArgument.lastName,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              secondPageArgument.age,
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
