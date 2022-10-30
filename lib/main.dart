import 'package:flutter/material.dart';
import 'package:todo_app/pages/homePage.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal.shade400,
          //backgroundColor: Color.fromARGB(221, 5, 5, 5),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
