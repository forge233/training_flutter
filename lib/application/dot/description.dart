class Description {
  final String description;
  final String image;

  const Description( {required this.image,required this.description});

  factory Description.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final String descriptionValue = json['description'];
      return Description(description: descriptionValue, image: '');
    } else {
      final List<dynamic> brand = json as List;
      final String firstDescription = brand.first as String;
      return Description(description: firstDescription, image: '');
    }
  }
}
