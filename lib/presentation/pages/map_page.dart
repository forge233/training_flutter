import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final double averagePrice = 0.0;

  @override
  Widget build(BuildContext context) {
    final Map<String, double> productList = {
      'Milk': 23.99,
      'Bread': 12.50,
      'Cheese': 56.20,
      'Eggs': 17.99,
      'Meat': 120.00,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Practice'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350.0,
              height: 300.0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10.0)),///TODO ...
              child: Center(
                child: Text(
                  productList.entries
                      .map((e) => '${e.key}: ${e.value}')
                      .join('\n'),///TODO це ти зробив чи chatGPT?
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 32.0),///TODO ...
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: 350.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.red),///TODO ...
              child:
                  Center(child: Text(getAveragePrice(productList).toString())),///TODO ...
            )
          ],
        ),
      ),
    );
  }

  double getAveragePrice(Map<String, double> productsList) {
    double averagePrice =
        productsList.values.reduce((value, element) => value + element);
    return averagePrice / productsList.length;
  }
}
