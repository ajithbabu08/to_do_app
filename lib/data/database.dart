
import 'package:hive/hive.dart';

class ToDoDataBase{
  // List toDoList= [];
  List<List<dynamic>> toDoList = [];
  final _myBox= Hive.box('mytodoBox');


  void initialData(){
    toDoList=[
      ["Make Tutorial",false,"best tutorials"],
      ["Do Cycling",false,"km to go"]
    ];
  }

  void loadData(){
    toDoList= _myBox.get("TODOLIST",defaultValue: []);
  }



  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}