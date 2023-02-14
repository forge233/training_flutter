import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuturePic extends StatelessWidget {
  const FuturePic({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FutureBuilder(
            future: getPict(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return Center(
                child: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Image> getPict() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg');
  }
}
