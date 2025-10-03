import 'package:flutter/widgets.dart';

abstract class AppColors {
  // light theme colors
  static const int primary = 0xFF6200EE;
  static const int primaryVariant = 0xFF3700B3;
  static const int secondary = 0xFF03DAC6;
  static const int secondaryVariant = 0xFF018786;
  static const int background = 0xFFFFFFFF;
  static const int surface = 0xFFFFFFFF;
  static const int error = 0xFFB00020;
  static const int onPrimary = 0xFFFFFFFF;
  static const int onSecondary = 0xFF000000;
  static const int onBackground = 0xFF000000;
  static const int onSurface = 0xFF000000;
  static const int onError = 0xFFFFFFFF;

  // static const List<int> lightColors = [0xFF6200EE, 0xFFB00020, 0xFF018786];
  static const List<Color> lightColors = [
    Color(0xFF6200EE),
    Color(0xFFB00020),
    Color(0xFF018786),
  ];

  // dark theme colors
  static const int darkPrimary = 0xFFBB86FC;
  static const int darkPrimaryVariant = 0xFF3700B3;
  static const int darkSecondary = 0xFF03DAC6;
  static const int darkSecondaryVariant = 0xFF03DAC6;
  static const int darkBackground = 0xFF000000;
  static const int darkSurface = 0xFF121212;
  static const int darkError = 0xFFCF6679;
  static const int darkOnPrimary = 0xFF000000;
  static const int darkOnSecondary = 0xFF000000;
  static const int darkOnBackground = 0xFFFFFFFF;
  static const int darkOnSurface = 0xFFFFFFFF;
  static const int darkOnError = 0xFF000000;

  // static const List<int> darkColors = [0xFFBB86FC, 0xFFCF6679, 0xFF03DAC6];
  static const List<Color> darkColors = [
    Color(0xFFBB86FC),
    Color(0xFFCF6679),
    Color(0xFF03DAC6),
  ];
}
