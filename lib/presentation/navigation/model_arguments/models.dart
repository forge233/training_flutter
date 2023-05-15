class Note {
  String title;
  String content;
  String noteId;

  DateTime get date => _date;
  final DateTime _date = DateTime.now();

  Note({required this.title, required this.content, required this.noteId});
}
