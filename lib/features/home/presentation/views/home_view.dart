import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text("Hello", style: TextStyle(fontSize: 30))),
    );
  }
}
