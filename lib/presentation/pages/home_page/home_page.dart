import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_album/application/dot/result.dart';
import 'package:photo_album/presentation/bloc/photo_state.dart';
import 'package:photo_album/presentation/pages/detail_page/detail_page.dart';

import '../../bloc/photo_bloc.dart';///TODO повний шлях
import '../../bloc/photo_event.dart';///TODO повний шлях

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> results = [];

  @override
  void initState() {
    super.initState();
    final photoBloc = BlocProvider.of<PhotoBloc>(context);///TODO на що записувати в змінну ?
    photoBloc.add(FetchPhotoDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (BuildContext context, state) {
        results = state.photoData;
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (context, index) {
                Result result = results[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: result.photo.id,
                        child: InkWell(
                          onTap: () {
                            _navigateToSecondPage(result);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image.network(
                              result.urls.thumb,
                              width: 400,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0)),
                      Text(result.user.name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16.0)),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0)),
                      Text(result.photo.description,
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _navigateToSecondPage(Result result) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          imageUrl: result.urls.full,
          altDescription: result.photo.altDescription,
          description: result.photo.description,
          bio: result.user.bio,
        ),
      ),
    );
  }
}
