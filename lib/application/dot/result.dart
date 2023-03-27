import 'package:json_university_practice/application/dot/country.dart';
import 'package:json_university_practice/application/dot/web_pages.dart';

import 'name.dart';

class Result {
  final Country country;
  final Name name;
  final WebPage webPage;

  const Result({
    required this.webPage,
    required this.country,
    required this.name,
  });


  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: Name.fromJson(json['name']),
      country: Country.fromJson(json['country']),
      webPage: WebPage.fromJson(json['web_pages']),
    );
  }
}
