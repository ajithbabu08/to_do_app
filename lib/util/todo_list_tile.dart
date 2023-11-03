import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/model.dart';
import '../screen/task_complete_info.dart';

class ToDoList extends StatelessWidget {

  ToDoList({super.key,});

  @override
  Widget build(BuildContext context) {
  final  todoBox = Hive.box<Todo>('todo_box');
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(),
      builder: (context,box,_) {

        return box.isEmpty?
         Center(
          child: Image.network("https://img.freepik.com/free-vector/team-checklist-concept-illustration_114360-9880.jpg"),
        ):
          ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (context,index) {

              Todo todo = box.getAt(index)!;
              return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(onPressed: (BuildContext context){box.deleteAt(index);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    borderRadius: BorderRadius.circular(10),)
                  ],
                ),

                child: GestureDetector(
                  onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(title: todo.title, description: todo.description,
                ),
              ),
            );
          },
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: todo.isCompleted,
                            onChanged: (value){
                            Todo newTodo = Todo(title: todo.title,description: todo.description,isCompleted: value!);
                            box.putAt(index, newTodo);
                            },
                            activeColor: Colors.black,),

                        Text(
                          todo.title!,style: TextStyle(
                            decoration: todo.isCompleted! ? TextDecoration.lineThrough
                        : TextDecoration.none),),
                      ],
                    ),
                  ),
                ),
              ),
        );
            }
          );
      }
    );
  }
}
