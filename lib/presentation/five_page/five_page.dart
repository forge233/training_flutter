import 'package:flutter/material.dart';
import 'package:forms_task/presentation/navigation/model_arguments/page_arguments.dart';

class FivePage extends StatefulWidget {///TODO нет смісла в StatefulWidget
  final SecondPageArgument secondPageArgument;

  const FivePage({
    super.key,
    required this.secondPageArgument,
  });

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  @override
  Widget build(BuildContext context) {
    widget.secondPageArgument;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Reg. info',///TODO не нужна запятая
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your info:',
              style: TextStyle(
                fontSize: 30.0,///TODO не нужна запятая
              ),
            ),
            Text(
              widget.secondPageArgument.nickN,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.secondPageArgument.firstName,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.secondPageArgument.lastName,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              widget.secondPageArgument.age,
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
