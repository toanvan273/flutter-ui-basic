import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/states/tasks_state.dart';
import 'package:flutter_ui/view/todo_v2/widgets/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);
  static const id = 'completed_tasks_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context,state){
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} Tasks',
                ),
              ),
            ),
            TasksList(tasksList: tasksList, idScreen: id,),
          ],
        );
      },
    );
  }
}











