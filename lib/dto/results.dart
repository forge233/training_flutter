import 'package:caurusel_slider/dto/picture.dart';

import 'name.dart';

class Result {
  final Name name;
  final Photo picture;

  const Result({required this.name, required this.picture});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: Name.fromJson(json['name']),
      picture: Photo.fromJson(json['picture']),
    );
  }
}
