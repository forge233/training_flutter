import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/provider/color_provider.dart';
import '../../button/colors_button.dart';

class ChangeBackgroundColor extends StatefulWidget {
  const ChangeBackgroundColor({super.key});

  @override
  State<ChangeBackgroundColor> createState() => _ChangeBackgroundColorState();
}

class _ChangeBackgroundColorState extends State<ChangeBackgroundColor> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor:
                Provider.of<ColorProvider>(context, listen: true).getColor,
            appBar: AppBar(
              title: const Text('ChangeBackgroundColor'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blueGrey,
                    ),
                    child: const Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 40.0,
                      children:  [
                        ColorsButton(
                            btnCol: Colors.blue,
                            textButton: 'Blue',
                            backgroundColorFunc: Colors.blue),
                        ColorsButton(
                          btnCol: Colors.redAccent,
                          textButton: 'Red',
                          backgroundColorFunc: Colors.redAccent,
                        ),
                        ColorsButton(
                            btnCol: Colors.grey,
                            textButton: 'White',
                            backgroundColorFunc: Colors.grey),
                        ColorsButton(
                            btnCol: Colors.deepPurpleAccent,
                            textButton: 'DeepPurple',
                            backgroundColorFunc: Colors.deepPurpleAccent),
                        ColorsButton(
                            btnCol: Colors.orangeAccent,
                            textButton: 'Orange',
                            backgroundColorFunc: Colors.orangeAccent),
                        ColorsButton(
                            btnCol: Colors.pinkAccent,
                            textButton: 'Pink Accent',
                            backgroundColorFunc: Colors.pinkAccent),
                        ColorsButton(
                            btnCol: Colors.lightBlue,
                            textButton: 'Light Blue',
                            backgroundColorFunc: Colors.lightBlue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
