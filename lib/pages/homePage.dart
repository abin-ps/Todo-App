import 'package:flutter/material.dart';
import 'package:todo_app/widgets/taskList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Color _primaryColor = Colors.tealAccent.shade400;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(221, 5, 5, 5),
        title: Text(
          "CheckList",
          style: TextStyle(color: _primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help_outline_rounded,
              size: 20,
              color: _primaryColor,
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(221, 5, 5, 5),
              child: Center(
                child: Text(
                  "To-Do($count)",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.99,
              width: MediaQuery.of(context).size.width,
              child: TaskList(),
            )),
            // Container(
            //   color: Colors.blueAccent,
            //   height: MediaQuery.of(context).size.height * 0.05,
            //   width: MediaQuery.of(context).size.width,
            //   child: GestureDetector(
            //     child: Icon(
            //       Icons.add,
            //       size: 25,
            //       color: _primaryColor,
            //     ),
            //     onTap: (){},
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
