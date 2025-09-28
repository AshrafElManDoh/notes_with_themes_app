import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/core/widgets/custom_button.dart';
import 'package:notes_with_themes_app/core/widgets/custom_text_form_field.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add note",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: themeColor.onSurface,
            ),
          ),
          SizedBox(height: 16),
          CustomTextFormField(hint: "Title", maxLines: 1),
          SizedBox(height: 16),
          CustomTextFormField(hint: "note", maxLines: 5),
          Spacer(),
          CustomButton(title: "Add"),
        ],
      ),
    );
  }
}
