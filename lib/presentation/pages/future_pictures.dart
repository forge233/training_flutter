import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FuturePic extends StatefulWidget {
  const FuturePic({super.key});

  @override
  State<FuturePic> createState() => _FuturePicState();
}

class _FuturePicState extends State<FuturePic> {
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

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
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<String> getPict() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return 'LOL';
  }
}
