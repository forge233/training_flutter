import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  List<Note> notes = [];

  NoteBloc() : super(NoteState([])) {
    on<NoteAddEvent>(onAddNote);
    on<NoteUpdateEvent>(onUpdateNote);
    on<NoteDeleteEvent>(onDeleteNote);
  }

  void onAddNote(NoteAddEvent event, Emitter<NoteState> emit) {
    notes.add(event.note);
    emit(state.copyWith(notes: notes));
  }

  void onUpdateNote(NoteUpdateEvent event, Emitter<NoteState> emit) {
    final updatedNotes = List<Note>.from(state.notes);
    final index = updatedNotes
        .indexWhere((note) => note.noteId == event.updatedNote.noteId);
    if (index != -1) {
      updatedNotes[index] = event.updatedNote;
      emit(state.copyWith(notes: updatedNotes));
    }
  }

  void onDeleteNote(NoteDeleteEvent event, Emitter<NoteState> emit) {
    notes.removeWhere((note) => note.noteId == event.noteId);
    emit(state.copyWith(notes: notes));
  }

  Note getNoteById(String noteId) {
    return state.notes.firstWhere((note) => note.noteId == noteId);
  }
}
