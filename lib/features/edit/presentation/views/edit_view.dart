import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_with_themes_app/core/widgets/custom_button.dart';
import 'package:notes_with_themes_app/core/widgets/custom_text_form_field.dart';
import 'package:notes_with_themes_app/features/home/data/models/note_model.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final noteCubit = context.read<NoteCubit>();
    noteCubit.titleController.text = note.title;
    noteCubit.contentController.text = note.note;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit note",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: themeColor.onSurface,
                ),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hint: "Title",
                maxLines: 1,
                controller: noteCubit.titleController,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hint: "Content",
                maxLines: 5,
                controller: noteCubit.contentController,
              ),
              SizedBox(height: 32),
              CustomButton(
                title: "Edit",
                onTap: () {
                  Navigator.pop(context);
                  noteCubit.editNote(note: note);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
