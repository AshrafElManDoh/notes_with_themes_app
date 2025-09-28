import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/app_constants.dart';
import 'package:notes_with_themes_app/core/helper/app_shared_pref.dart';
import 'package:notes_with_themes_app/core/utils/app_themes.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;
  ThemeCubit(this.initialTheme) : super(initialTheme);

  toggleTheme(ThemeData theme) {
    ThemeData newTheme = theme == AppThemes.getDarkTheme()
        ? AppThemes.getLightTheme()
        : AppThemes.getDarkTheme();
    emit(newTheme);
    cache(newTheme);
  }

  cache(ThemeData theme) async {
    AppSharedPref.saveData(
      key: AppConstants.kAppThemeKey,
      value: theme == AppThemes.getDarkTheme(),
    );
  }
}
