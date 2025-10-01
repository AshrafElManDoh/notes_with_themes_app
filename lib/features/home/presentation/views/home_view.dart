import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_with_themes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_with_themes_app/features/home/presentation/views/widgets/bottom_sheet_body.dart';
import 'package:notes_with_themes_app/features/home/presentation/views/widgets/note_Item.dart';
import 'package:notes_with_themes_app/features/home/presentation/views_model/note_cubit/note_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteCubit>();
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteCubit.clearController();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => BottomSheetBody(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return Column(
                spacing: 8,
                children: List.generate(
                  noteCubit.loadNotes().length,
                  (index) => NoteItem(note: noteCubit.loadNotes()[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
