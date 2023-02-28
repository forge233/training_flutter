class Photo {
  final String large;
  final String medium;
  final String thumbnail;

  const Photo({required this.large, required this.medium, required this.thumbnail});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
