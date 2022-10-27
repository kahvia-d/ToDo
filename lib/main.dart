import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/TodoPage.dart';
import 'model/TodosData.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box=await Hive.openBox("list");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        //创建todolist数据模型
        TodosData todosData=TodosData();
        //试图从本地存储中通过关键字获取todos，没有则创建初始化todos，也就是样例
        if(todosData.db.box.get("TODOLIST")==null) {
          todosData.db.initialTodo();
        } else {//有则从本地初始化数据
          todosData.db.loadTodoData();
        }
        //返回构建好的数据模型作为全局共享的数据
        return todosData;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: TodoPage(),
      ),
    );
  }
}


