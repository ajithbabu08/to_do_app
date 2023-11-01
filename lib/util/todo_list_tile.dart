import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {

  final String taskTitle;
  final bool doneTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;


  ToDoList({super.key,
  required this.taskTitle,
    required this.doneTask,
  required this.onChanged,
  required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(14),)
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(14)
          ),
          child: Row(
            children: [
              Checkbox(value: doneTask,
                  onChanged: onChanged,
              activeColor: Colors.black,),

              Text(
                taskTitle,style: TextStyle(
                  decoration: doneTask ? TextDecoration.lineThrough
              : TextDecoration.none),),

            ],
          ),
        ),
      ),
    );
  }
}
