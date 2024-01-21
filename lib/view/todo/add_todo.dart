import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/todo_bloc.dart';
import 'package:flutter_ui/events/todo_event.dart';
import 'package:flutter_ui/models/task_todo.dart';
import 'package:flutter_ui/services/services.dart';
import 'package:flutter_ui/states/todo_state.dart';

class AddTodo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddTodo();
  }
}

class _AddTodo extends State<AddTodo>{
  late TextEditingController _titleEditingController;
  late TextEditingController _detailEditingController;
  String title = '';
  String detail = '';

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
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Add Todo'),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state){
            print('???? ${state.totalTask}');
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    obscureText: false,
                    controller: _titleEditingController,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        border: UnderlineInputBorder()
                    ),
                    onChanged: (value){
                      setState(() {
                        title = value;
                      });
                    },
                  ), TextField(
                    obscureText: false,
                    controller: _detailEditingController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Detail action'
                    ),
                    onChanged: (v){
                      detail = v;
                    },
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
            if(title.length!=0 && detail.length !=0){
              String? deviceId = await getId();
              var taskTodo = TaskTodo(id: deviceId ?? '', title: title, content: detail);
              print(taskTodo.toString());
              context.read<TodoBloc>().add(TodoAddEvent(taskTodo));
            }

          },
          child: const Icon(Icons.check),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      ),
    );
  }
}