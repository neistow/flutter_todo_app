import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_todo/providers/todo_store.dart';
import 'package:yet_another_todo/widgets/create_todo_page.dart';
import 'package:yet_another_todo/widgets/todo_list.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  void initState() {
    context.read<ToDoStore>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoStore>(
      builder: (ctx, store, child) => Scaffold(
        appBar: AppBar(title: const Text('ToDo List')),
        body: store.loading
            ? const Center(child: CircularProgressIndicator())
            : ToDoList(toDos: store.toDos),
        floatingActionButton: store.loading
            ? null
            : FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => const CreateToDoPage()),
                  );
                },
              ),
      ),
    );
  }
}
