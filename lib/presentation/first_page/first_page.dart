import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  String inputText = '';///TODO не нужна

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TextField Controller'), ///TODO должен быть конст
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),///TODO должен быть конст
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onSubmitted: (text) {
                  setState(
                    () {
                      inputText = text;///TODO используя контролер тебе не нужна єта переменная она уже есть в контроллере controller.text
                    },
                  );
                },
              ),
            ),
          ),
          Text(
            'Number - $inputText',///TODO используй контроллер
            style: const TextStyle(color: Colors.black, fontSize: 20.0),///TODO ,
          ),
        ],
      ),
    );
  }
}
