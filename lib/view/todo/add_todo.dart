import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/services/guid_gen.dart';
import 'package:flutter_ui/view/todo/bloc/todo_bloc.dart';
import 'package:flutter_ui/view/todo/bloc/todo_event.dart';
import 'package:flutter_ui/models/task_todo.dart';
import 'package:flutter_ui/view/todo/bloc/todo_state.dart';

class AddTodo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddTodo();
  }
}

class _AddTodo extends State<AddTodo>{
  late TextEditingController _titleEditingController;
  late TextEditingController _detailEditingController;

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _detailEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
    _detailEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Add Todo'),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    obscureText: false,
                    controller: _titleEditingController,
                    decoration: const InputDecoration(
                        labelText: 'Title',
                        border: UnderlineInputBorder()
                    )
                  ), TextField(
                    obscureText: false,
                    controller: _detailEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Detail action'
                    )
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Text(state.totalTask.toString())
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
              var taskTodo = TaskTodo(
                  id: GUIDGen.generate(),
                  title: _titleEditingController.text,
                  content: _detailEditingController.text);
              context.read<TodoBloc>().add(TodoAddEvent(taskTodo));
              Navigator.of(context).pop();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}