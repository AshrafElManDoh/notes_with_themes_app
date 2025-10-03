import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_with_themes_app/core/app_constants.dart';
import 'package:notes_with_themes_app/features/home/data/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  int colorNewNoteIndex = 0;

  String saveTime() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    String date = "${now.day}-${now.month}-${now.year}";
    String period = hour >= 12 ? "PM" : "AM";

    String formattedTime =
        "$date\n${hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)}:${minute.toString().padLeft(2, '0')} $period";

    return formattedTime;
  }

  List<NoteModel> loadNotes() {
    List<NoteModel> list = Hive.box<NoteModel>(
      AppConstants.kNoteBox,
    ).values.toList();
    return list;
  }

  void saveNote({required NoteModel note}) async {
    emit(LoadNote());
    var box = await Hive.openBox<NoteModel>(AppConstants.kNoteBox);
    box.add(note);
    clearAll();
    colorNewNoteIndex = 0;
    emit(AddNote());
  }

  void clearAll() {
    titleController.clear();
    contentController.clear();
    colorNewNoteIndex = 0;
  }

  Future<void> deleteNote({required NoteModel note}) async {
    await note.delete();
    emit(DeleteNote());
  }

  Future<void> editNote({required NoteModel note}) async {
    note.title = titleController.text;
    note.content = contentController.text;
    note.color = colorNewNoteIndex;
    await note.save();
    clearAll();
    emit(EditNote());
  }
}
