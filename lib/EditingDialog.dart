import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/TodosData.dart';
class EditingDialog extends StatelessWidget {
  EditingDialog({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.green.shade200,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
              child: TextField(
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "Your todo item",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 70,),
                ElevatedButton(
                  onPressed: (){
                    context.read<TodosData>().addTodo([
                      controller.text,false
                    ]);
                    Navigator.pop(context);
                  },
                  child: const Text("Save")
                ),
                SizedBox(width: 15,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
