class ApiFeaturedImage {
  final String apiFeaturedImage;

  const ApiFeaturedImage({required this.apiFeaturedImage});

  factory ApiFeaturedImage.fromJson(dynamic json) {
    if (json is String) {
      return ApiFeaturedImage(apiFeaturedImage: json);
    } else {
      final List<dynamic> apiFeaturedImage = json as List<dynamic>;
      final String firstApiPicture = apiFeaturedImage.first as String;
      return ApiFeaturedImage(apiFeaturedImage: firstApiPicture);
    }
  }
}
