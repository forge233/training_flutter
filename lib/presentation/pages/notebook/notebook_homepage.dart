import 'package:flutter/material.dart';
import 'package:forms_task/storage/storage.dart';

class NoteBook extends StatefulWidget {
  const NoteBook({super.key});

  @override
  State<NoteBook> createState() => _NoteBookState();
}

List<Widget> windowEnteryText = [];

createTextBorder() {
  return TextField(
    onChanged: (text) {
      DeviceStorage.setText(text);
    },
    decoration: const InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(width: 10.0))),
  );
}

class _NoteBookState extends State<NoteBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('NoteBook'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: windowEnteryText,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            windowEnteryText.add(createTextBorder());
          });
          final enterText = await DeviceStorage.getText();
          print(enterText);
        },
        child: const Text('+'),
      ),
    );
  }
}
