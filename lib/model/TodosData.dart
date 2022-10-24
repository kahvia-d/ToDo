import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';

class TodosData extends ChangeNotifier{
  TodoDataBase db=TodoDataBase();


  List get toDoList=>db.todoList;

  void changeTodoStatus(int index){
    db.todoList[index][1]=!db.todoList[index][1];
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