import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/TodosData.dart';
class EditingDialog extends StatelessWidget {
  EditingDialog({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.orangeAccent,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Your todo item",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.orange
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: Colors.orange
                    )
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){
                    context.read<TodosData>().addTodo([
                      controller.text,false
                    ]);
                    Navigator.pop(context);
                  },
                  child: const Text("Save")
                ),
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
