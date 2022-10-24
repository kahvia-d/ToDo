import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
  //获得main方法中已经打开的box
  final box=Hive.box("list");
  List todoList=[];

  void initialTodo(){
    todoList=[["It's just an example",false]];
  }

  void loadTodoData(){
    todoList=box.get("TODOLIST");
  }

  void updateTodoData(){
    box.put("TODOLIST", todoList);
  }

}