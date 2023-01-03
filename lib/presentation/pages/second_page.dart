import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String viewText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                onSubmitted: (text) {
                  setState(
                    () {
                      viewText = text;
                    },
                  );
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 10.0),
                  ),
                  labelText: 'Введите текст',
                ),

              ),
            ),
          ),
          Text(
            'Ваш текст - $viewText',
            style: const TextStyle(color: Colors.black, fontSize: 20.0),

            ///TODO запятая
          )
        ],
      ),
    );
  }
}
