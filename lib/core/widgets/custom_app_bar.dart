import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/cubits/theme_cubit.dart';
import 'package:notes_with_themes_app/core/utils/app_themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();
    return AppBar(
      // centerTitle: true,
      forceMaterialTransparency: true,
      
      title: Text(
        "Notes App",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      titleTextStyle: TextStyle(fontSize: 25),
      actions: [
        IconButton(
          onPressed: () {
            cubit.toggleTheme(cubit.state);
          },
          icon: Icon(
            cubit.state == AppThemes.getDarkTheme()
                ? Icons.light_mode
                : Icons.dark_mode,
            color: Theme.of(context).colorScheme.onSurface,
            size: 30,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
