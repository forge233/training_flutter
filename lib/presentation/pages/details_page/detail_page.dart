import 'package:api_makeup/presentation/navigation/model_arguments/model_arguments.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final SecondPageArguments secondPageArguments;

  const DetailPage({
    Key? key,
    required this.secondPageArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                'http:${secondPageArguments.apiFeaturedImage.apiFeaturedImage}',
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                secondPageArguments.description.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
