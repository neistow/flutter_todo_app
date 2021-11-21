import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_todo/models/todo.dart';
import 'package:yet_another_todo/providers/todo_store.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({Key? key}) : super(key: key);

  @override
  State<CreateToDoPage> createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
  String? _title;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: _titleValidator,
                onSaved: _onTitleSaved,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text('Create'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _onSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    final toDo = ToDo(title: _title!, completed: false);
    context.read<ToDoStore>().add(toDo);

    Navigator.pop(context);
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field should not be empty';
    }
    return null;
  }

  void _onTitleSaved(String? value) {
    _title = value;
  }
}
