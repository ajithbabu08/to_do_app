
import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList= [];

  final _myBox= Hive.box('mytodoBox');


  void initialData(){
    toDoList=[
      ["Make Tutorial",false],
      ["Do Cycling",false]
    ];
  }

  void loadData(){
    toDoList= _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}