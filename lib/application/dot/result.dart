import 'package:api_makeup/application/dot/brand.dart';
import 'package:api_makeup/application/dot/description.dart';
import 'package:api_makeup/application/dot/picture_api.dart';
import 'package:api_makeup/application/dot/price.dart';

import 'name.dart';

class Result {
  final Price price;
  final Name name;
  final ApiFeaturedImage apiFeaturedImage;
  final Brand brand;
  final Description description;

  const Result({
    required this.apiFeaturedImage,
    required this.price,
    required this.name,
    required this.brand,
    required this.description,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: Name.fromJson(json['name']),
      price: Price.fromJson(json['price']),
      apiFeaturedImage: ApiFeaturedImage.fromJson(json['api_featured_image']),
      brand: Brand.fromJson(json['brand']),
      description: Description.fromJson(json['description']),
    );
  }
}
