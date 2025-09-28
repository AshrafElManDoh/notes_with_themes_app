import 'package:flutter/material.dart';
import 'package:notes_with_themes_app/features/edit/presentation/views/edit_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    String period = hour >= 12 ? "PM" : "AM";

    String formattedTime =
        "${hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour)}:${minute.toString().padLeft(2, '0')} $period";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditView()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: themeColor.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "title",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: themeColor.onPrimary,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "I am flutter developer",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: themeColor.onPrimary,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: themeColor.onPrimary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: themeColor.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
