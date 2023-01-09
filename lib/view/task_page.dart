import 'package:flutter/material.dart';
import 'package:todo_app/themes/theme.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<dynamic> toDoList = [
    ["Done New Task", false],
    ["TicTacToe game task", true],
  ];
  final newTaskController = TextEditingController();

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
          itemCount: toDoList.length,
          itemBuilder: (context, index) => TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          ),
        ),);
  }

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
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
      toDoList.add(
        [newTaskController.text, false],
      );
    });
    newTaskController.clear();
    Navigator.of(context).pop();
  }
}
