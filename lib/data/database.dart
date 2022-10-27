import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
  //获得main方法中已经打开的box
  final box=Hive.box("list");
  List todoList=[];
  //日期和数量的对子，代表在某一天完成了多少次事件
  Map<DateTime,int> finishedStatus={};

  void initialTodo(){
    todoList=[["It's just an example",false]];
    finishedStatus={};
  }

  void loadTodoData(){
    todoList=box.get("TODOLIST");
    finishedStatus=Map<DateTime,int>.from(box.get("STATUS")) ?? {};

  }

  void updateTodoData(){
    box.put("TODOLIST", todoList);
    box.put("STATUS", finishedStatus);
    print(box.get("STATUS"));
  }

}