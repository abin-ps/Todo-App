import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/view/task_page.dart';
import 'package:todo_app/themes/theme.dart';

void main() async {
  //initialize hive database
  await Hive.initFlutter();

  //Open a box
  var box = await Hive.openBox("myBox");

  runApp(const TodoApp());
}

// Todo App
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: secColor),
      home: TaskPage(),
    );
  }
}
