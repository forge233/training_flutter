import 'package:shared_preferences/shared_preferences.dart';

class DeviceStorage {
  void saveData(String title, String content, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('title', title);
    await prefs.setString('content', content);
    await prefs.setString('id', id);
  }

  Future<Map<String, String>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String title = prefs.getString('title') ?? '';
    String content = prefs.getString('content') ?? '';
    String id = prefs.getString('id') ?? '';
    return {'title': title, 'content': content, 'id': id};
  }
}
