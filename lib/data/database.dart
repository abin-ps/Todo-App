import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //Reference the box
  final _myBox = Hive.box("myBox");

  // Run this method if this is the first time openning this app
  void createInitialData() {
    toDoList = [
      ["Take a small break", false],
      ["Do TicTacToe Game", false],
    ];
  }

  // Load data from db
  void loadData() {
    toDoList = _myBox.get("ToDoList");
  }

  // Update db
  void updateDataBase() {
    _myBox.put("ToDoList", toDoList);
  }
}
