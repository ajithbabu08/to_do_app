import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/model.dart';

class FinishedTasks extends StatelessWidget {
  FinishedTasks();

  @override
  Widget build(BuildContext context) {
    final todoBox = Hive.box<Todo>('todo_box');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Finished Tasks"),
      ),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, box, _) {
          List<Todo> completedTask = [];
          for (var todo in box.values) {
            if (todo.isCompleted) {
              completedTask.add(todo);
            }
          }

          if (completedTask.isEmpty) {
            // Show a message when there are no completed tasks
            return Center(
              child: Text('No completed tasks.'),
            );
          } else {
            // Show the list of completed tasks when there are completed tasks
            return ListView.builder(
              itemCount: completedTask.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      title: Text(completedTask[index].title),
                      subtitle: Text(completedTask[index].description),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
