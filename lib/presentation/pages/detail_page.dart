import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.bookDetails});

  final Map<String, String> bookDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Автор: ${bookDetails['author']}',
              style: const TextStyle(fontSize: 21.0),
            ),
            Text('Видавництво: ${bookDetails['publisher']}',
                style: const TextStyle(fontSize: 21.0))
          ],
        ),
      ),
    );
  }
}
