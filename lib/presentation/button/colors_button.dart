import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/provider/color_provider.dart';

class ColorsButton extends StatefulWidget {///TODO в first_page
   final Color btnCol;
     final String textButton;
     final Color backgroundColorFunc;
  const ColorsButton(
      {super.key,
      required this.btnCol,
      required this.textButton,
      required this.backgroundColorFunc});

  @override
  State<ColorsButton> createState() => _ColorsButtonState();
}

class _ColorsButtonState extends State<ColorsButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.0),
      child: InkWell(
        onTap: () {
          Provider.of<ColorProvider>(context, listen: false)
              .changeColor(widget.backgroundColorFunc);
        },
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.btnCol,
          ),
          child: Center(
            child: Text(
              widget.textButton,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
