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
    return AlertDialog(backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
             decoration: InputDecoration(border: OutlineInputBorder(),
             hintText: "Title"),
              controller: titlecontroller,
            ),

            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: "Task detail"),
              controller: taskcontroller,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                functionButton(text: "Save",onPressed: onSave),

                const SizedBox(width: 10,),

                functionButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
