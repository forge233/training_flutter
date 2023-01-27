import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/provide/counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provide Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvide>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter.toString(),
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterProvide>(context, listen: false)
                          .addCount();
                    },
                    child: const Text('+')),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterProvide>(context, listen: false)
                        .minusCount();
                  },
                  child: const Text('-'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
