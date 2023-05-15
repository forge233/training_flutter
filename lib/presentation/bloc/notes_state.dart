import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';

class NoteState {
  final List<Note> notes;

  NoteState(this.notes);

  NoteState copyWith({List<Note>? notes}) {
    return NoteState(notes ?? this.notes);
  }
}