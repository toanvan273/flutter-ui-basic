import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/states/tasks_state.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';
import 'package:flutter_ui/widgets/tasks_list.dart';

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
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
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