import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
      );
  }


  
}
