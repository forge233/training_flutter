import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/provider/provide.dart';

class ChangeBackgroundColor extends StatefulWidget {
  const ChangeBackgroundColor({super.key});

  @override
  State<ChangeBackgroundColor> createState() => _ChangeBackgroundColorState();
}

class _ChangeBackgroundColorState extends State<ChangeBackgroundColor> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Changer(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Provider.of<Changer>(context, listen: false).setColor,
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
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 40.0,
                      children: [
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() { ///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.grey);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'Blue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                () {
                                  Provider.of<Changer>(context, listen: false)
                                      .changeColor(Colors.redAccent);
                                },
                              );
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.redAccent,
                              ),
                              child: const Center(
                                child: Text(
                                  'Red',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.grey);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey,
                              ),
                              child: const Center(
                                child: Text(
                                  'White',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material( ///TODO винеси кнопку в окремий віджет це дозволить оптимізувати код  https://www.digitalocean.com/community/tutorials/what-is-dry-development
                          color: Colors.black.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.deepPurpleAccent);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.deepPurpleAccent,
                              ),
                              child: const Center(
                                child: Text(
                                  'DeepPurple',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0, ///TODO не потрібна ,
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.orangeAccent);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.deepOrangeAccent,
                              ),
                              child: const Center(
                                child: Text(
                                  'Orange',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.pinkAccent);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.pinkAccent,
                              ),
                              child: const Center(
                                child: Text(
                                  'Pink',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.black);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Text(
                                  'Black',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.grey.withOpacity(0.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {///TODO setState тут не потрібен, бо ми використовуємо тут провайдер
                                Provider.of<Changer>(context, listen: false)
                                    .changeColor(Colors.lightBlue);
                              });
                            },
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.lightBlue,
                              ),
                              child: const Center(
                                child: Text(
                                  'Light Blue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
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
