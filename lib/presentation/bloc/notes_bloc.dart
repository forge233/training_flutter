import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list_from_bloc/presentation/navigation/model_arguments/models.dart';
import '../../application/storage/storage.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  List<Note> notes = [];

  NoteBloc() : super(NoteState([])) {
    on<NoteAddEvent>(onAddNote);
    on<NoteUpdateEvent>(onUpdateNote);
    on<NoteDeleteEvent>(onDeleteNote);
    on<NoteSortDateEvent>(onSortNoteDate);
    on<NoteSortTitleEvent>(onSortNoteTitle);
    on<NoteLoadDataEvent>(onLoadData);
  }

  void onAddNote(NoteAddEvent event, Emitter<NoteState> emit) {
    final addNotes = List<Note>.from(state.notes);
    addNotes.add(event.note);
    emit(state.copyWith(notes: addNotes));
  }

  void onUpdateNote(NoteUpdateEvent event, Emitter<NoteState> emit) {
    final updatedNotes = List<Note>.from(state.notes);
    final index = updatedNotes
        .indexWhere((note) => note.noteId == event.updatedNote.noteId);
    if (index != -1) {
      updatedNotes[index] = event.updatedNote;
      DeviceStorage.saveData(updatedNotes);
      emit(state.copyWith(notes: updatedNotes));
    }
  }

  void onDeleteNote(NoteDeleteEvent event, Emitter<NoteState> emit) {
    final deleteNotes = List<Note>.from(state.notes);
    deleteNotes.removeWhere((note) => note.noteId == event.noteId);
    DeviceStorage.saveData(deleteNotes);
    emit(state.copyWith(notes: deleteNotes));
  }

  void onSortNoteDate(NoteSortDateEvent event, Emitter<NoteState> emit) {
    final sortNoteDate = List<Note>.from(state.notes);
    sortNoteDate.sort((a, b) => a.date.compareTo(b.date));
    emit(state.copyWith(notes: sortNoteDate));
  }

  void onSortNoteTitle(NoteSortTitleEvent event, Emitter<NoteState> emit) {
    final sortNoteTime = List<Note>.from(state.notes);
    sortNoteTime.sort((a, b) => b.title.compareTo(a.title));
    emit(state.copyWith(notes: sortNoteTime));
  }

  void onLoadData(NoteLoadDataEvent event, Emitter<NoteState> emit) async {
    List<Note> notes = await DeviceStorage.loadData();
    emit(NoteState(notes));
  }
}
