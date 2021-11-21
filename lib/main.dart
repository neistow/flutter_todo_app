import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_todo/providers/todo_store.dart';
import 'package:yet_another_todo/widgets/todo_list_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => ToDoStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const ToDoListPage()
    );
  }
}