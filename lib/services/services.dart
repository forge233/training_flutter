import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/user.dart';

class PersonService {
  static Future<User> fetchDataToDto() async {
     String url = 'https://randomuser.me/api/?inc=name,picture';

    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final User user = User.fromJson(responseData);
    return user;
  }
}
