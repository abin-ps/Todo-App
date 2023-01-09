import 'package:flutter/material.dart';
import 'package:todo_app/view/task_page.dart';
import 'package:todo_app/themes/theme.dart';

void main() {
  runApp(const TodoApp());
}

// Todo App
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: secColor),
      home:  TaskPage(),
    );
  }
}
