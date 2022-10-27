import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';

class TodosData extends ChangeNotifier{
  TodoDataBase db=TodoDataBase();


  List get toDoList=>db.todoList;
  Map<DateTime,int> get finishedStatus=>db.finishedStatus;

  void changeTodoStatus(int index){
    DateTime now=DateTime.now();
    db.todoList[index][1]=!db.todoList[index][1];
    if(db.todoList[index][1]){
      // int? count=db.finishedStatus[DateTime(now.year,now.month,now.day)];
      if(db.finishedStatus[DateTime(now.year,now.month,now.day)]==null){
        db.finishedStatus[DateTime(now.year,now.month,now.day)]=0;
      }
      db.finishedStatus[DateTime(now.year,now.month,now.day)]=(db.finishedStatus[DateTime(now.year,now.month,now.day)]!+1)!;
    }
    else{
      db.finishedStatus[DateTime(now.year,now.month,now.day)]=(db.finishedStatus[DateTime(now.year,now.month,now.day)]!-1)!;
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