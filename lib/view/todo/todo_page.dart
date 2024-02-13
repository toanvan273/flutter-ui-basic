import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/constant/todo.dart';
import 'package:flutter_ui/view/todo/bloc/todo_event.dart';
import 'package:flutter_ui/models/task_todo.dart';
import 'package:flutter_ui/view/todo/filter_menu.dart';
import 'package:flutter_ui/view/todo/bloc/todo_bloc.dart';
import 'package:flutter_ui/view/todo/bloc/todo_state.dart';
import 'package:flutter_ui/view/todo/todo_detail.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';


class TodoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
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



class TodoList extends StatelessWidget{
  List<TaskTodo> filterTask(List<TaskTodo> allTask, FilterItem? filter){
    if(filter == null) {
      return allTask;
    }else{
      switch(filter){
        case FilterItem.all:
          return allTask;
        case FilterItem.completed:
          return allTask.where((e) => e.completed == true).toList();
        case FilterItem.active:
          return allTask.where((e) => e.completed == false).toList();
        default:
          return allTask;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context,state){
        var listTask = filterTask(state.allTask, state.filter);
        return Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: listTask.length,
              itemBuilder: (BuildContext context, int index){
                var task = listTask[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TodoDetail()
                    ));
                  },
                  child: Container(
                    child: ListTile(
                      leading: Checkbox(
                          value: task.completed,
                          onChanged: (bool? value){
                            context.read<TodoBloc>().add(TodoUpdateEvent(task));
                          }
                      ),
                      title: Text('[${task.id}]'),
                      isThreeLine: true,
                      subtitle: Text('${task.title}: ${task.content}'),
                      dense: true,
                    ),
                  ),
                );
              },
            ))
          ],
        );
      },
    );
  }
}






