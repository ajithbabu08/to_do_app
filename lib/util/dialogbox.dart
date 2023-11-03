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
                  hintText: "Description"),
              controller: taskcontroller,
              maxLines: 12,
            ),

            SizedBox(height: 12,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                functionButton(text: "Save",onPressed: onSave),

                functionButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
