import 'package:flutter/material.dart';
///TODO удали
class TextFieldForms extends StatefulWidget {
  TextFieldForms(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.entryText, required properties,});

  final TextEditingController controller;
  String entryText = '';
  TextInputType keyboardType = TextInputType.text;
   RegExp properties = RegExp('');

  @override
  State<TextFieldForms> createState() => _TextFieldFormsState();
}

class _TextFieldFormsState extends State<TextFieldForms> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.entryText,
      ),
      keyboardType: TextInputType.text,
      validator: (text) {
        final validNickname = widget.properties;
        if (text == null || text.isEmpty) {
          return 'Поле не может быть пустым';
        } else if (validNickname.hasMatch(text)) {
          return 'С заглавном буквы латиницой';
        } else if (text.length < 4) {
          return 'Не менее 4х символов';
        }
        return null;
      },
    );
  }
}
