import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.maxLines,
    required this.controller,
    this.hint,
  });
  final int maxLines;
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is required !";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hint: hint == null ? null : Text(hint!),
        border: customBorder(themeColor),
        enabledBorder: customBorder(themeColor),
      ),
    );
  }

  OutlineInputBorder customBorder(ColorScheme themeColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: themeColor.onSurface),
    );
  }
}
