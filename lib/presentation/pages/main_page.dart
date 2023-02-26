import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselTask extends StatefulWidget {
  const CarouselTask({super.key});

  @override
  State<CarouselTask> createState() => CarouselTaskState();
}

class CarouselTaskState extends State<CarouselTask> {
  int currentIndex = 0;
  bool swipeScroll = true;
  final listItems = List.generate(10, (index) => index.toString());
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1E7D6),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Carousel',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider.builder(
            itemCount: listItems.length,
            itemBuilder: (context, int index, _) {
              Color iconColor = currentIndex == index
                  ? const Color(0xFFFFD234)
                  : const Color(0xFFF2E8D8);
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    child: Container(
                      width: 75.0,
                      height: 100.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF69655E),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.android_outlined,
                        size: 35.0,
                        color: iconColor,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15.0)),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: 30.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: swipeScroll && currentIndex == index
                          ? const Color(0xFFFFD234).withOpacity(1.0)
                          : const Color(0xFF69655E).withOpacity(0.0),
                      borderRadius: BorderRadius.circular(7.0),
                      border: currentIndex == index
                          ? Border.all(width: 1.0, color: Colors.black)
                          : Border.all(width: 0.0, color: Colors.transparent),
                    ),
                  ),
                ],
              );
            },
            carouselController: carouselController,
            options: CarouselOptions(
              onPageChanged: (index, _) {
                setState(() {
                  currentIndex = index;
                });
              },
              aspectRatio: 2,
              viewportFraction: 0.2,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 30.0)),
        ],
      ),
    );
  }
}
