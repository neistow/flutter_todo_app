// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$ToDoFromJson(Map<String, dynamic> json) => ToDo(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
