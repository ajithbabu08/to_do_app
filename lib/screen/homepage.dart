import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/model.dart';
import 'package:to_do_app/screen/taskscompleted.dart';


import '../util/dialogbox.dart';
import '../util/todo_list_tile.dart';

class homepageTodo extends StatefulWidget {
  const homepageTodo({super.key});

  @override
  State<homepageTodo> createState() => _homepageTodoState();
}

class _homepageTodoState extends State<homepageTodo> {

  final todo = Hive.box<Todo>('todo_box');

  @override
  void initState() {
      todo.isEmpty?
      Center(child:
      Image.network("https://img.freepik.com/free-vector/team-checklist-concept-illustration_114360-9880.jpg",
        fit: BoxFit.contain,)):
      ToDoList();
    super.initState();
  }


  final titlecontroller=TextEditingController();
  final taskcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade200,
        title: Center(child: Text("To Do")),
      actions: [
        PopupMenuButton(itemBuilder: (context){
          return[
            PopupMenuItem(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FinishedTasks()));
                },
                child: Text("Finished Tasks")),
          ];
        }),SizedBox(width: 10,),
      ],
      elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),

      body:

      ValueListenableBuilder(
          valueListenable: todo.listenable(),
          builder: (context, box, _) {
    return todo.isEmpty
    ? Center(
    child: Image.network(
    "https://img.freepik.com/free-vector/team-checklist-concept-illustration_114360-9880.jpg"),
    ) : ToDoList();

    }),
    );
  }


  void addNewTask(){
    print(todo.values.toList());
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            titlecontroller: titlecontroller,
            taskcontroller: taskcontroller,
            onSave: saveNewTask,
            onCancel: ()=> Navigator.of(context).pop(),
          );
        });
    titlecontroller.text="";
    taskcontroller.text="";


  }

  void saveNewTask(){
    Todo  newTodo = Todo(title: titlecontroller.text, description: taskcontroller.text, isCompleted: false);
    todo.add(newTodo);
    Navigator.of(context).pop();
  }

}
