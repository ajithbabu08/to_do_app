import 'package:flutter/material.dart';

import 'action_button.dart';

class DialogBox extends StatelessWidget {

  final titlecontroller;
  final taskcontroller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({super.key,
    required this.titlecontroller,
    required this.taskcontroller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(backgroundColor: Colors.white,
      content: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
             decoration: InputDecoration(border: OutlineInputBorder(),
             hintText: "Title"),
              controller: titlecontroller,
            ),

            SizedBox(height: 13,),

            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: "Task detail"),
              controller: taskcontroller,
              maxLines: 13,
            ),

            SizedBox(height: 13,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                functionButton(text: "Save",onPressed: onSave),

                const SizedBox(width: 5,),

                functionButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
