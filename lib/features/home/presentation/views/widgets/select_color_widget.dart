import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/app_constants.dart';
import 'package:notes_with_themes_app/core/helper/app_shared_pref.dart';
import 'package:notes_with_themes_app/core/utils/app_colors.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

class SelectColorWidget extends StatefulWidget {
  const SelectColorWidget({super.key});

  @override
  State<SelectColorWidget> createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteCubit>();
    List<Color> colors =
        AppSharedPref.getData(AppConstants.kAppThemeKey) as bool
        ? AppColors.darkColors
        : AppColors.lightColors;
    return Row(
      spacing: 10,
      children: List.generate(
        colors.length,
        (index) => GestureDetector(
          onTap: () {
            noteCubit.colorNewNoteIndex = index;
            setState(() {});
          },
          child: colorItem(
            color: colors[index],
            isSelected: noteCubit.colorNewNoteIndex == index,
          ),
        ),
      ),
    );
  }

  CircleAvatar colorItem({required Color color, required bool isSelected}) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: color,
      child: isSelected ? Icon(Icons.check) : null,
    );
  }
}
