import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List _taskList = [
    "complete js project within one week",
    "start learning node js as soon as possible"
  ];
  bool _doneTask = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: _buildTodoList(),
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "${_taskList[index]}",
            style: _doneTask
                ? TextStyle(
                    color: Colors.grey, decoration: TextDecoration.lineThrough)
                : TextStyle(color: Colors.black),
          ),
          onTap: () {
            setState(() {
              _doneTask = !_doneTask;
            });
          },
        );
      },
    );
  }
}
