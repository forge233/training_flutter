import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/navigation/model_arguments/models.dart';

class DeviceStorage {
  static Future<void> saveData(List<Note> notes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String notesJson = jsonEncode(notes.map((note) => note.toJson()).toList());
    await prefs.setString('noteData', notesJson);
  }

  static Future<List<Note>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? notesJson = prefs.getString('noteData');
    if (notesJson != null) {
      List<dynamic> notesData = jsonDecode(notesJson);
      List<Note> notes = Note.fromJsonList(notesData);
      print('Loaded notes: $notes'); // Отладочный вывод
      return notes;
    }
    return [];
  }

  static Future<void> removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('noteData');
  }
}
