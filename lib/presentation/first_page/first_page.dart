import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TextField Controller'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onSubmitted: (text) {
                  setState(
                    () {
                      inputText = text;
                    },
                  );
                },
              ),
            ),
          ),
          Text(
            'Number - $inputText',
            style: const TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
