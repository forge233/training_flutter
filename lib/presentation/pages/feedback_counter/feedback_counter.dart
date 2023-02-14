import 'package:flutter/material.dart';
import 'package:forms_task/application/provider/provide.dart';
import 'package:provider/provider.dart';

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
            const SizedBox(
              height: 10.0, ///TODO ...
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ///TODO винеси в окремий метод
                        ///TODO для оптимізування можна використовувати такий синтаксис це теж саме
                        // Provider.of<Counter>(context, listen: false)
                        // ..good()
                        // ..total()
                        // ..percentage();

                        Provider.of<Counter>(context, listen: false).good();
                        Provider.of<Counter>(context, listen: false).total();
                        Provider.of<Counter>(context, listen: false)
                            .percentage();
                      },
                      child: const Text('Good')),

                  ///TODO ...
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ///TODO ...
                        Provider.of<Counter>(context, listen: false).netural();
                        Provider.of<Counter>(context, listen: false).total();
                        Provider.of<Counter>(context, listen: false)
                            .percentage();
                      },
                      child: const Text('Neutral')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ///TODO ...
                        Provider.of<Counter>(context, listen: false).bad();
                        Provider.of<Counter>(context, listen: false).total();
                        Provider.of<Counter>(context, listen: false)
                            .percentage();
                      },
                      child: const Text('Bad')),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,  ///TODO ...

            ),
            const Text(
              'Statistics:',
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
            Text('Good: ${Provider.of<Counter>(context).getGood.toString()}'),
            Text(
                'Neutral: ${Provider.of<Counter>(context).getNeutral.toString()}'),
            Text('Bad: ${Provider.of<Counter>(context).getBad.toString()}'),
            const SizedBox(
              height: 20.0,///TODO ...
            ),
            Text(
              'Total: ${Provider.of<Counter>(context).getTotal.toString()}',
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              'Percentage: ${Provider.of<Counter>(context).getPercent.toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
