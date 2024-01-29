import 'package:flutter/material.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';

class ResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Todos'),
        actions: [
          const Icon(Icons.more_horiz)
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Text('Active todo: '),
              Text('xx')
            ],),
            Row(children: [
              Text('Completed todo: '),
              Text('xx')
            ],)

          ],
        ),
      ),
    );
  }
}