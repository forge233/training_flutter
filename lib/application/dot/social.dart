class Social {
  String? instagramUsername;
  String portfolioUrl;
  String? twitterUsername;

  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      instagramUsername: json['instagram_username'],
      portfolioUrl: json['portfolio_url'],
      twitterUsername: json['twitter_username'],
    );
  }
}