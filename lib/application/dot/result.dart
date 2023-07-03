import 'package:photo_album/application/dot/photo.dart';
import 'package:photo_album/application/dot/social.dart';
import 'package:photo_album/application/dot/urls.dart';
import 'package:photo_album/application/dot/user.dart';

class Result {
  final Urls urls;
  final User user;
  final Photo photo;


  Result({
    required this.urls,
    required this.user,
    required this.photo,

  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      urls: Urls.fromJson(json['urls']),
      user: User.fromJson(json['user']),
      photo: Photo.fromJson(json['photo']),
    );
  }
}
