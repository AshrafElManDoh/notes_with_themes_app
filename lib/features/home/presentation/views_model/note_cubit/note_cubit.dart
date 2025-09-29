import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleFormField = TextEditingController();
  TextEditingController noteFormField = TextEditingController();
}
