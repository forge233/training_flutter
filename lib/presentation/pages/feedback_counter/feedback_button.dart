import 'package:forms_task/application/provider/provider_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton(
      {super.key, required this.text, required this.voteValue,});

  final String text;
  final Function voteValue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          voteValue.call();
          Provider.of<ProviderCounter>(context, listen: false).total();
          Provider.of<ProviderCounter>(context, listen: false).percentage();
        },
        child: Text(text));
  }
}
