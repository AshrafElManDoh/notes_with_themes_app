import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.maxLines,
    this.hint,
    this.initialValue,
  });
  final int maxLines;
  final String? hint, initialValue;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      decoration: InputDecoration(
        hint: hint == null ? null : Text(hint!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: themeColor.onSurface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: themeColor.onSurface),
        ),
      ),
    );
  }
}
