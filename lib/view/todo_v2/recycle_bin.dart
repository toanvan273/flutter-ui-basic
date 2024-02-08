import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_event.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_state.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';
import 'package:flutter_ui/view/todo_v2/widgets/tasks_list.dart';

class RecycleBin extends StatelessWidget{
  static const id = 'recyle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      label: Text(
                        '${state.removedTasks.length} Tasks',
                      ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: () => context.read<TasksBloc>().add(const DeleteAllTask()),
                        child: const Text('Delete all', style: TextStyle(color: Colors.black),)
                    )
                  ]
                ),
              ),
              TasksList(tasksList: state.removedTasks, idScreen: id,),
            ],
          ),
        );
      },
    );
  }
}