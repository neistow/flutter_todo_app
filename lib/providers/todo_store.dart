import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yet_another_todo/common/constants.dart';
import 'package:yet_another_todo/models/todo.dart';
import 'package:http/http.dart' as http;

class ToDoStore with ChangeNotifier {
  List<ToDo> toDos = [];
  bool loading = false;

  Future fetch() async {
    loading = true;
    final response = await http.get(Uri.parse('${Constants.apiUrl}/todos'));
    await Future.delayed(const Duration(seconds: 2));
    toDos = (jsonDecode(response.body) as Iterable)
        .map((toDo) => ToDo.fromJson(toDo))
        .toList();
    loading = false;
    notifyListeners();
  }

  Future add(ToDo toDo) async {
    final response = await http.post(Uri.parse('${Constants.apiUrl}/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(toDo.toJson()));
    toDos.add(ToDo.fromJson(jsonDecode(response.body)));
    notifyListeners();
  }

  Future update(ToDo toDo) async {
    final response = await http.put(
        Uri.parse('${Constants.apiUrl}/todos/${toDo.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(toDo.toJson()));
    toDos[toDos.indexOf(toDo)] = ToDo.fromJson(jsonDecode(response.body));
    notifyListeners();
  }

  Future remove(ToDo toDo) async {
    await http.delete(Uri.parse('${Constants.apiUrl}/todos/${toDo.id}'));
    toDos.remove(toDo);
    notifyListeners();
  }
}
