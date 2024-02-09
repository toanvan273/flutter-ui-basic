import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context,state){
        print(state.allTask);
        print(state.filter);
        return Column(
          children: [
            Container(child: TextButton(
              child: Text('ADD Task'),
              onPressed: (){
                var task = TaskTodo(id: 'A1', title: 'Test title', content: 'content test');
                context.read<TodoBloc>().add(TodoAddEvent(task));
              },
            ),),
            Expanded(child: ListView.builder(
              itemCount: state.allTask.length,
              itemBuilder: (BuildContext context, int index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TodoDetail()
                    ));
                  },
                  child: Container(
                    child: ListTile(
                      leading: Checkbox(value: false, onChanged: (bool? value){}),
                      title: Text('[${state.allTask[index].id}] ${state.allTask[index].title}'),
                      isThreeLine: true,
                      subtitle: Text('${state.allTask[index].content}'),
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






