import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provider_counter.dart';
import 'package:provider/provider.dart';

import 'feedback_button.dart';

class FeedbackCounter extends StatefulWidget {
  const FeedbackCounter({super.key});

  @override
  State<FeedbackCounter> createState() => _FeedbackCounterState();
}

class _FeedbackCounterState extends State<FeedbackCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback Counter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please leave feedback',
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeedbackButton(
                    text: 'Good',
                    voteValue:
                        Provider.of<ProviderCounter>(context, listen: false)
                            .good,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeedbackButton(
                    text: 'Neutral',
                    voteValue:
                        Provider.of<ProviderCounter>(context, listen: false)
                            .netural,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FeedbackButton(
                    text: 'Bad',
                    voteValue:
                        Provider.of<ProviderCounter>(context, listen: false)
                            .bad,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Statistics:',
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
            Text(
                'Good: ${Provider.of<ProviderCounter>(context).getGood.toString()}'),
            Text(
                'Neutral: ${Provider.of<ProviderCounter>(context).getNeutral.toString()}'),
            Text(
                'Bad: ${Provider.of<ProviderCounter>(context).getBad.toString()}'),
            const SizedBox(height: 20.0),
            Text(
              'Total: ${Provider.of<ProviderCounter>(context).getTotal.toString()}',
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              'Percentage: ${Provider.of<ProviderCounter>(context).getPercent.toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
