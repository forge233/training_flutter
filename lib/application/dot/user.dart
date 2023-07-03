class User {
  String id;
  String? updatedAt;
  String username;
  String name;
  String firstName;
  String? lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String location;

  User({
    required this.id,
    this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      updatedAt: json['updated_at'],
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      twitterUsername: json['twitter_username'] ?? '',
      portfolioUrl: json['portfolio_url'] ?? '',
      bio: json['bio'] ?? '',
      location: json['location'] ?? '',
    );
  }
}