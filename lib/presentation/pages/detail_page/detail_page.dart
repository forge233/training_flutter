import 'package:flutter/material.dart';
import 'package:photo_album/application/dot/result.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String altDescription;
  final String description;
  final String bio;

  const DetailPage({
    Key? key,
    required this.imageUrl,
    required this.altDescription,
    required this.description,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(altDescription,
                    style: const TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(bio, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
