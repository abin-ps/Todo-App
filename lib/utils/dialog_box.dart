import 'package:flutter/material.dart';
import 'package:todo_app/themes/theme.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: dilogBg,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Add a new task", border: OutlineInputBorder(),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonText: "Cancel", onPressed: onCancel),
                const SizedBox(width: 8,),
                MyButton(buttonText: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
