import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_album/application/dot/result.dart';
import 'package:photo_album/application/dot/urls.dart';
import 'package:photo_album/application/dot/user.dart';
import 'package:photo_album/application/dot/photo.dart';

class ServiceJson {
  static Future<List<Result>> fetchDataToDto() async {
    String url =
        'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final List result = responseData
        .map(
          (json) => Result(
            urls: Urls.fromJson(json['urls']),
            user: User.fromJson(json['user']),
            photo: Photo.fromJson(json),
          ),
        )
        .toList();
    return List<Result>.from(result);
  }
}
