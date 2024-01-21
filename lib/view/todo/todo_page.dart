import 'package:flutter/material.dart';
import 'package:flutter_ui/view/todo/filter_menu.dart';
import 'package:flutter_ui/view/todo/todo_list.dart';

class TodoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todos'),
        actions: [
          FilterMenu(),
          MarkCompleteMenu()
        ],
      ),
      body: TodoList(),
      // bottomNavigationBar: _BottomAppBar(),

    );
  }
}









