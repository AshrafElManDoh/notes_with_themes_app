import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/core/widgets/custom_app_bar.dart';
import 'package:notes_with_themes_app/core/widgets/custom_button.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit note",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: themeColor.onSurface,
                ),
              ),
              SizedBox(height: 16),
              // CustomTextFormField(hint: "Title", maxLines: 1),
              SizedBox(height: 16),
              // CustomTextFormField(hint: "note", maxLines: 5),
              SizedBox(height: 32,),
              CustomButton(title: "Add"),
            ],
          ),
        ),
      ),
    );
  }
}
