import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/core/utils/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Prime",
  scaffoldBackgroundColor: const Color(AppColors.background),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(AppColors.primary),
    onPrimary: Color(AppColors.onPrimary),
    secondary: Color(AppColors.secondary),
    onSecondary: Color(AppColors.onSecondary),
    error: Color(AppColors.error),
    onError: Color(AppColors.onError),
    surface: Color(AppColors.surface),
    onSurface: Color(AppColors.onSurface),
    primaryContainer: Color(AppColors.primaryVariant),
    secondaryContainer: Color(AppColors.secondaryVariant),
  ),
  appBarTheme: const AppBarTheme(
    // backgroundColor: Color(AppColors.primary),
    iconTheme: IconThemeData(color: Color(AppColors.onPrimary)),
    titleTextStyle: TextStyle(
      color: Color(AppColors.onSurface),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: "Prime"
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(AppColors.secondary),
    foregroundColor: Color(AppColors.onSecondary),
  ),
);
