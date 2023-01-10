import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/themes/theme.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final db = ToDoDataBase();
  final newTaskController = TextEditingController();
  // Reference the hive box
  final _myBox = Hive.box("myBox");

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("ToDoList") != null) {
      db.loadData();
    } else {
      db.createInitialData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primColor,
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(color: accentColor),
        ),
        centerTitle: true,
        elevation: .5,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: createNewTask,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
        ),
      ),
    );
  }

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateDataBase();
    });
  }

// creating new task
  createNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              controller: newTaskController,
              onSave: saveNewTask,
              onCancel: () {
                newTaskController.clear();
                Navigator.of(context).pop();
              },
            ),
        barrierDismissible: false);
  }

// add new task to list
  saveNewTask() {
    setState(() {
      db.toDoList.add(
        [newTaskController.text, false],
      );
      db.updateDataBase();
    });
    newTaskController.clear();
    Navigator.of(context).pop();
  }

  // Delete  task
  deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDataBase();
    });
  }
}
