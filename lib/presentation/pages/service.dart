import 'dart:convert';

import 'package:api_makeup/application/dot/description.dart';
import 'package:api_makeup/application/dot/picture_api.dart';
import 'package:http/http.dart' as http;

import 'package:api_makeup/application/dot/brand.dart';
import 'package:api_makeup/application/dot/name.dart';
import 'package:api_makeup/application/dot/price.dart';
import 'package:api_makeup/application/dot/result.dart';

class ServiceJson {
  static Future<List<Result>> fetchDataToDto(String brand) async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand';
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final List result = responseData
        .map(
          (json) => Result(
            price: Price.fromJson(json['price']),
            name: Name.fromJson(json['name']),
            apiFeaturedImage:
                ApiFeaturedImage.fromJson(json['api_featured_image']),
            brand: Brand.fromJson(json),
            description: Description.fromJson(json),
          ),
        )
        .toList();
    return List<Result>.from(result);
  }
}
