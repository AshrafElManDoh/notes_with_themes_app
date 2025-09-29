import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_with_themes_app/core/app_constants.dart';
import 'package:notes_with_themes_app/core/cubits/theme_cubit.dart';
import 'package:notes_with_themes_app/core/helper/app_shared_pref.dart';
import 'package:notes_with_themes_app/core/utils/app_themes.dart';
import 'package:notes_with_themes_app/features/home/data/models/note_model.dart';
import 'package:notes_with_themes_app/features/home/presentation/views/home_view.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(AppConstants.kNoteBox);
  final bool isDarkmode =
      AppSharedPref.getData(AppConstants.kAppThemeKey) as bool? ?? false;
  runApp(
    MyApp(
      initialTheme: isDarkmode
          ? AppThemes.getDarkTheme()
          : AppThemes.getLightTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialTheme});
  final ThemeData initialTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(initialTheme)),
        BlocProvider(create: (context) => NoteCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state,
            themeAnimationCurve: Curves.easeInOut,
            themeAnimationDuration: Duration(milliseconds: 500),
            home: const HomeView(),
          ),
        ),
      ),
    );
  }
}
