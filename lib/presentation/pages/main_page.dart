import 'dart:async';

import 'package:flutter/material.dart';

class StreamCounter extends StatefulWidget {
  const StreamCounter({super.key});

  @override
  State<StreamCounter> createState() => _StreamCounterState();
}

class _StreamCounterState extends State<StreamCounter> {
  final StreamController<int> _streamController = StreamController<int>();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Counter'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder<int>(
              stream: _streamController.stream,
              initialData: counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  'Count: ${snapshot.data}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20.0),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    counter++;
                    _streamController.sink.add(counter);
                  },
                  child: const Text('+')),
              const SizedBox(width: 5.0),
              ElevatedButton(
                onPressed: () {
                  counter--;
                  _streamController.sink.add(counter);
                },
                child: const Text('-'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
