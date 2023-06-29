class Note {
  String title;
  String content;
  String noteId;

  DateTime get date => _date;
  final DateTime _date = DateTime.now();

  Note({
    required this.title,
    required this.content,
    required this.noteId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'noteId': noteId,
    };
  }

  static List<Note> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Note.fromJson(json)).toList();
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
      noteId: json['noteId'],
    );
  }
}
