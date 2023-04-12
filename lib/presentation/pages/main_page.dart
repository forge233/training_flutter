import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamPractice extends StatefulWidget {
  const StreamPractice({Key? key}) : super(key: key);

  @override
  StreamPracticeState createState() => StreamPracticeState();
}

class StreamPracticeState extends State<StreamPractice> {
  late StreamController<String> phrasesController;
  late StreamController<Color> colorController;
  late StreamController<double> sizeController;
  int selectedStream = 0;

  @override
  void initState() {
    super.initState();
    phrasesController = StreamController<String>.broadcast();
    colorController = StreamController<Color>.broadcast();
    sizeController = StreamController<double>.broadcast();

    Timer.periodic(const Duration(seconds: 2), (_) {
      if (phrasesController.hasListener) {
        phrasesController.add(_getRandomPhrase());
      }
    });
    Timer.periodic(const Duration(seconds: 2), (_) {
      if (colorController.hasListener) {
        colorController.add(_getRandomColor());
      }
    });
    Timer.periodic(const Duration(seconds: 2), (_) {
      if (sizeController.hasListener) {
        sizeController.add(_getRandomSize());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Stream'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder<String>(
              stream: selectedStream == 0 ? phrasesController.stream : const Stream.empty(),
              builder: (BuildContext context, AsyncSnapshot<String> phraseSnapshot) {
                return StreamBuilder<Color>(
                  stream: selectedStream == 1 ? colorController.stream : const Stream.empty(),
                  builder: (context, AsyncSnapshot<Color> colorSnapshot) {
                    return StreamBuilder<double>(
                      stream: selectedStream == 2 ? sizeController.stream : const Stream.empty(),
                      builder: (context, AsyncSnapshot<double> sizeSnapshot) {
                        return AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          width: sizeSnapshot.data,
                          color: colorSnapshot.data,
                          height: sizeSnapshot.data,
                          child: Center(
                            child: Text(
                              phraseSnapshot.data.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 50.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectedStream = 0;
                },
                child: const Text('Фразы'),
              ),
              const SizedBox(width: 5.0),
              ElevatedButton(
                onPressed: () {
                  selectedStream = 1;
                },
                child: const Text('Цвет'),
              ),
              const SizedBox(width: 5.0),
              ElevatedButton(
                  onPressed: () {
                    selectedStream = 2;
                  },
                  child: const Text('Размер'))
            ],
          )
        ],
      ),
    );
  }

  String _getRandomPhrase() {
    final phrases = [
      'Привет',
      'Таке життя',
      'Смерть русским',
      'Путин хуйло',
      'Русня - гойский скот',
      'Ниггерия ебашит русских мужиков',
      'Со всей силы',
      'Че каво сучара?',
      'Чао',
    ];
    return phrases[Random().nextInt(phrases.length)];
  }

  Color _getRandomColor() {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.grey,
      Colors.deepOrange,
      Colors.deepPurple
    ];
    return colors[Random().nextInt(colors.length)];
  }

  double _getRandomSize() {
    return 50.0 + Random().nextInt(201);
  }
}
