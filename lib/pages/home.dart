import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_task_outlined),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("data")],
                  );
                });
              // setState(() {
              //   _taskList.add({"title": "text", "doneTaskFlag": false});
              // });
            
          },
        ),
      );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(_taskList[index]["doneTaskFlag"]
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank),
          title: Text(
            "${_taskList[index]["title"]}",
            style: _taskList[index]["doneTaskFlag"]
                ? TextStyle(
                    color: Colors.grey, decoration: TextDecoration.lineThrough)
                : TextStyle(color: Colors.black),
          ),
          onTap: () {
            setState(() {
              _taskList[index]["doneTaskFlag"] =
                  !_taskList[index]["doneTaskFlag"];
            });
          },
        );
      },
    );
  }
}