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
  List<Map> _taskList = [
    {
      "title": "complete js project within one week",
      "doneTaskFlag": false,
    },
    {
      "title": "start learning node js as soon as possible",
      "doneTaskFlag": false,
    },
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
          leading: Icon(_taskList[index]["doneTaskFlag"]?Icons.check_box_outlined: Icons.check_box_outline_blank),
          title: Text(
            "${_taskList[index]["title"]}",
            style: _taskList[index]["doneTaskFlag"]
                ? TextStyle(
                    color: Colors.grey, decoration: TextDecoration.lineThrough)
                : TextStyle(color: Colors.black),
          ),
          onTap: () {
            setState(() {
              _taskList[index]["doneTaskFlag"] = !_taskList[index]["doneTaskFlag"];
            });
          },
        );
      },
    );
  }
}
