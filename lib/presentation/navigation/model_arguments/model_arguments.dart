import 'package:api_makeup/application/dot/description.dart';
import 'package:api_makeup/application/dot/picture_api.dart';

class SecondPageArguments {
  final Description description;
  final ApiFeaturedImage apiFeaturedImage;

  SecondPageArguments(
      {required this.apiFeaturedImage, required this.description});
}
