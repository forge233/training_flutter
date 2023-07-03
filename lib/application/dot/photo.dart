class Photo {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String description;
  String altDescription;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;

  Photo({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      slug: json['slug'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      promotedAt: json['promoted_at'] != null ? DateTime.parse(json['promoted_at']) : null,
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      description: json['description'] ?? '',
      altDescription: json['alt_description'] ?? '',
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      currentUserCollections: json['current_user_collections'] ?? [],
    );
  }

}
