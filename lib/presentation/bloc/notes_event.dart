import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';

abstract class NoteEvent {}

class NoteAddEvent extends NoteEvent {
  final Note note;

  NoteAddEvent(this.note);

  List<Object?> get props => [note];
}

class NoteUpdateEvent extends NoteEvent {
  final Note updatedNote;

  NoteUpdateEvent(this.updatedNote);

  List<Object?> get props => [updatedNote];
}

class NoteDeleteEvent extends NoteEvent {
  final String noteId;

  NoteDeleteEvent(this.noteId);

  List<Object?> get props => [noteId];
}

class NoteSortDateEvent extends NoteEvent {}

class NoteSortTitleEvent extends NoteEvent {}
