import 'package:caurusel_slider/dto/results.dart';

class User {
  final List<Result> results;

  const User({required this.results});

  factory User.fromJson(Map<String, dynamic> json) => User(
        results: List<Result>.from(
          json['results'].map(
            (result) => Result.fromJson(result),
          ),
        ),
      );
}
