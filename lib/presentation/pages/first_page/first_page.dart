import 'package:flutter/material.dart';

class WrapTest extends StatefulWidget {
  const WrapTest({super.key});

  @override
  State<WrapTest> createState() => _WrapTestState();
}

class _WrapTestState extends State<WrapTest> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 20.0),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blueAccent,
              child: Wrap(
                runAlignment: WrapAlignment.spaceEvenly,
                alignment: WrapAlignment.center,
                spacing: 10.0,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        '+1',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 2;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple,
                      ),
                      child: const Text('+2',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 3;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.deepPurple,
                      ),
                      child: const Text('+3',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 4;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('+4',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 5;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('+5',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count += 100;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('+100',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        setState(() {
                          count += 1500;
                        });
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('+1500',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('-',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count -= 1000;
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text('-1000',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
