import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Todos'),
        actions: [
          Icon(Icons.more_horiz)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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