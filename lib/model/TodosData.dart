import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';

class TodosData extends ChangeNotifier{
  TodoDataBase db=TodoDataBase();


  List get toDoList=>db.todoList;
  Map<DateTime,int> get finishedStatus=>db.finishedStatus;

  void changeTodoStatus(int index){
    DateTime now=DateTime.now();
    DateTime dateTime=DateTime(now.year,now.month,now.day);
    db.todoList[index][1]=!db.todoList[index][1];
    if(db.todoList[index][1]){
      if(db.finishedStatus[dateTime]==null){
        db.finishedStatus[dateTime]=0;
      }
      db.finishedStatus[dateTime]=(db.finishedStatus[dateTime]!+1)!;
    }
    else{
      db.finishedStatus[dateTime]=(db.finishedStatus[dateTime]!-1)!;
    }
    db.updateTodoData();
    notifyListeners();
  }

  void addTodo(List todo){
    db.todoList.add(todo);
    db.updateTodoData();
    notifyListeners();
  }

  void removeTodo(int index){
    db.todoList.removeAt(index);
    db.updateTodoData();
    notifyListeners();
  }
}