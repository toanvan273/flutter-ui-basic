
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.idScreen
  });

  final Task task;
  final String idScreen;
  void _removeOrDeleteTask(BuildContext context, Task task){
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough: null
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: task.isDeleted == false ? (value){
          context.read<TasksBloc>().add(UpdateTask(task: task));
        }: null,
      ),
      onLongPress: ()=> _removeOrDeleteTask(context, task),
    );
  }
}