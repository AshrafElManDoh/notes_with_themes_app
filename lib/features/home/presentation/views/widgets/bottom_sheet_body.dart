import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/widgets/custom_button.dart';
import 'package:notes_with_themes_app/core/widgets/custom_text_form_field.dart';
import 'package:notes_with_themes_app/features/home/data/models/note_model.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final noteCubit = context.read<NoteCubit>();
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: noteCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add note",
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
                title: "Add",
                onTap: () {
                  if (noteCubit.formKey.currentState!.validate()) {
                    noteCubit.formKey.currentState!.save();
                    noteCubit.saveNote(
                      note: NoteModel(
                        title: noteCubit.titleController.text,
                        note: noteCubit.contentController.text,
                        date: noteCubit.saveTime(),
                        color: 1,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
