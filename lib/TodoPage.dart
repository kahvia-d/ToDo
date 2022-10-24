import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/EditingDialog.dart';
import 'model/TodosData.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //点击添加按钮则显示添加todo的消息框，这个生成的消息框是TodoPage的同级。所以ChangeNotifierProvider要添加在MaterialApp（）的父级才能被dialog正常使用。
          showDialog(context: context, builder: (context){
            return EditingDialog();
          });
        },
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  late List toDoList;

  @override
  Widget build(BuildContext context) {
    toDoList=context.watch<TodosData>().toDoList;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            taskName: toDoList[index][0],
            finished: toDoList[index][1],
            onChanged: (oldStatus){
              context.read<TodosData>().changeTodoStatus(index);
            },
            onDelete: (context){
              context.read<TodosData>().removeTodo(index);
            },
          );
        },
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String taskName;
  final bool finished;
  Function(bool?)? onChanged;
  Function(BuildContext context)? onDelete;
  TodoItem({Key? key, required this.taskName, required this.finished, required this.onChanged,required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Slidable(//可滑动的组件
        //end代表从右边往左边滑动
        endActionPane: ActionPane(//滑动选项面板
          motion: const StretchMotion(),//滑动动画
          children: [
            //SlidableAction是单个滑动选项
            SlidableAction(
              onPressed: onDelete,//触发删除的函数
              icon: Icons.delete,//图标
              backgroundColor: Colors.redAccent,//背景色
              borderRadius: BorderRadius.circular(12),//圆角
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          // height: 60,
          decoration:  BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Checkbox(
                value: finished,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(decoration: finished?TextDecoration.lineThrough:TextDecoration.none),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}


