import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/app_constants.dart';
import 'package:notes_with_themes_app/core/helper/app_shared_pref.dart';
import 'package:notes_with_themes_app/core/utils/app_colors.dart';
import 'package:notes_with_themes_app/features/edit/presentation/views/edit_view.dart';
import 'package:notes_with_themes_app/features/home/data/models/note_model.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    final noteCubit = context.read<NoteCubit>();
    List<Color> colors =
        AppSharedPref.getData(AppConstants.kAppThemeKey) as bool
        ? AppColors.darkColors
        : AppColors.lightColors;
    return GestureDetector(
      onTap: () {
        noteCubit.colorNewNoteIndex = note.color;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditView(note: note)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colors[note.color],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: themeColor.onPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<NoteCubit>().deleteNote(note: note);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: themeColor.onPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              note.content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: themeColor.onPrimary,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  note.date,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: themeColor.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
