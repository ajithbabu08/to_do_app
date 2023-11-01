import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/screen/task_complete_info.dart';

import '../util/dialogbox.dart';
import '../util/todo_list_tile.dart';

class homepageTodo extends StatefulWidget {
  const homepageTodo({super.key});

  @override
  State<homepageTodo> createState() => _homepageTodoState();
}

class _homepageTodoState extends State<homepageTodo> {

  final _myBox=Hive.box('mytodoBox');
  ToDoDataBase db=ToDoDataBase();



  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.initialData();
    }else{
      db.loadData();
    }
    super.initState();
  }


  final titlecontroller=TextEditingController();
  final taskcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("To Do"),
      elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index){
        return GestureDetector(

          ///remove
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TaskDetailPage(
                    title: db.toDoList[index][0], // Set the title
                    description: 'Description of the task', // Replace with the actual description from your data source
                  ),
                ),
              );
            },
            child: ToDoList(
              taskTitle: db.toDoList[index][0],
              doneTask: db.toDoList[index][1],
              onChanged: (value) => checkBoxState(value, index),
              deleteTask: (context) => deleteTask(index),
            ),
        );
      }),
    );
  }

  checkBoxState(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] =! db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void addNewTask(){
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
    setState(() {
      db.toDoList.add([titlecontroller.text, false]);
      // titlecontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


}
