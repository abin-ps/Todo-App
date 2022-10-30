import 'package:flutter/material.dart';
import 'package:todo_app/widgets/tasks.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tasks> tasksList = [
    Tasks(title: "flutter bbeginners"),
    Tasks(title: "js bbeginners"),
  ];
  TextStyle taskStyle =  TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w300);

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTodoList(),
    );
  }

  Widget _buildTodoList() {
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(221, 5, 5, 5),
          child: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        child: ListTile(
                            leading: taskIcon(index),
                            title: taskTitle(index)),
                        onTap: () {
                          setState(() {
                            tasksList[index].isDone = !tasksList[index].isDone;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .04,
                      child: Center(
                        child: TextButton(
                          child: Center(child: Text(".",style: taskStyle,)),
                          onPressed: () {
                            newTask(
                                context: context,
                                index: index,
                                isEdit: !tasksList[index].isEdit,
                                task: tasksList[index].title);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                taskController.clear();
                newTask(context: context);
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.teal,
            ),
          ),
        )
      ],
    );
  }

  Widget taskIcon(int index){
    return Icon(tasksList[index].isDone
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,color: Colors.tealAccent.shade400,);
  }

  Widget taskTitle(int index) => Text(
        tasksList[index].title,
        style: tasksList[index].isDone
            ? const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(
                color: Colors.white,
              ),
      );

  newTask(
      {String task = "",
      bool isEdit = false,
      int index = 0,
      required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (BuildContext contextt) {
          isEdit ? taskController.text = task : null;
          return AlertDialog(
            title: Column(
              children: [
                TextField(
                  controller: taskController,
                  cursorColor: Colors.tealAccent.shade400,
                  
                  // textAlign: TextAlign.center,
                  autofocus: true,
                  maxLength: 25,
                  onSubmitted: (value) {
                    isEdit ? _saveEditedTask(index) : _saveNewTask();
                  },
                ),
                SizedBox(height: 15),
                TextButton(
                  onPressed: () =>
                      isEdit ? _saveEditedTask(index) : _saveNewTask(),
                  child: Text("Save",style: TextStyle(color: Colors.tealAccent.shade400),),
                ),
              ],
            ),
          );
        });
  }

//*save new task
  _saveNewTask() {
    (taskController.text != "")
        ? setState(() {
            tasksList.add(Tasks(title: taskController.text));
            taskController.clear();
            Navigator.pop(context);
          })
        : Navigator.pop(context);
  }

//*edit excisting task
  _saveEditedTask(int index) {
    (taskController.text != "")
        ? setState(() {
            tasksList[index].title = taskController.text;
            taskController.clear();
            Navigator.pop(context);
          })
        : Navigator.pop(context);
  }
}
