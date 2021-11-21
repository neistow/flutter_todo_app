import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class ToDo {
  int id;
  String title;
  bool completed;

  ToDo({this.id = 0, required this.title, required this.completed});

  void check() {
    completed = !completed;
  }

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}