import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_university_practice/application/dot/name.dart';
import 'package:json_university_practice/application/dot/result.dart';
import 'package:json_university_practice/application/dot/web_pages.dart';
import 'package:json_university_practice/application/dot/country.dart';

class ServiceJson {
  static Future<List<Result>> fetchDataToDto(String country) async {
    String url = 'http://universities.hipolabs.com/search?country=$country';

    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final List result = responseData
        .map(
          (json) => Result(
            webPage: WebPage.fromJson(json["web_pages"]),
            country: Country.fromJson(json["country"]),
            name: Name.fromJson(json["name"]),
          ),
        )
        .toList();
    return List<Result>.from(result);
  }
}
