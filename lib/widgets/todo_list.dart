import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_todo/models/todo.dart';
import 'package:yet_another_todo/providers/todo_store.dart';

import 'todo_list_item.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> toDos;

  const ToDoList({Key? key, required this.toDos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final toDo in toDos)
          Dismissible(
            key: ValueKey(toDo.id),
            child: ToDoListItem(toDo: toDo),
            background: Container(
              color: Colors.pink.shade50.withOpacity(0.75),
              child: const Icon(Icons.delete)
            ),
            onDismissed: (_) {
              context.read<ToDoStore>().remove(toDo);
            },
          )
      ],
    );
  }
}
