
import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TodoDetail();
  }
}

class _TodoDetail extends State<TodoDetail>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Detail Todo'),
        ),
        body: Container(
          child: Text('Detail todo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.edit),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
        ),
      ),
    );
  }
}