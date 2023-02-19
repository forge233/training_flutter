import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/provider/provider.dart';

class CounterHomePage extends StatelessWidget {
  CounterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Random Counter'),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    Provider.of<CounterProvider>(context)
                        .incrementCountOne
                        .toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                    child: Text(
                  Provider.of<CounterProvider>(context)
                      .incrementCountTwo
                      .toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                )),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (randomNumber == 0) {
                        Provider.of<CounterProvider>(context, listen: false)
                            .plusValueOne();
                      } else {
                        Provider.of<CounterProvider>(context, listen: false)
                            .plusValueTwo();
                      }
                    },
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Increment',
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (randomNumber == 0) {
                        Provider.of<CounterProvider>(context, listen: false)
                            .minusValueOne();
                      } else {
                        Provider.of<CounterProvider>(context, listen: false)
                            .minusValueTwo();
                      }
                    },
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Discernment',
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
