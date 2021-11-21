import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_todo/models/todo.dart';
import 'package:yet_another_todo/providers/todo_store.dart';

class ToDoListItem extends StatelessWidget {
  final ToDo toDo;

  const ToDoListItem({Key? key, required this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(toDo.id),
      title: Text(
        toDo.title,
        style: TextStyle(
            decoration: toDo.completed ? TextDecoration.lineThrough : null,
            color: toDo.completed ? Colors.grey.shade500 : Colors.black),
      ),
      leading: Checkbox(
          value: toDo.completed,
          onChanged: (_) async {
            toDo.check();
            await context.read<ToDoStore>().update(toDo);
          }),
    );
  }
}
