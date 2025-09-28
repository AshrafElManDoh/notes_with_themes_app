import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_with_themes_app/features/home/presentation/views/widgets/bottom_sheet_body.dart';
import 'package:notes_with_themes_app/features/home/presentation/views/widgets/note_Item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => BottomSheetBody(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: List.generate(7, (index) => NoteItem()),
          ),
        ),
      ),
    );
  }
}
