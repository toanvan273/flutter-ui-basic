import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/view/todo_v2/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

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
        : context.read<TasksBloc>().add(RemoveTask(task: task, idScreen: idScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(width: 10,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                            decoration: task.isDone! ? TextDecoration.lineThrough: null
                        )
                    ),
                    Text(DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.parse(task.date))),
                  ],
                )),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false ? (value){
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }: null,
              ),
              PopupMenu(
                cancelOrDeleteCallback: () => 
                _removeOrDeleteTask(context, task),
                task: task,
              )
            ]
          ),

        ],
      ),
    );
  }
}

// ListTile(
// title: Text(
// task.title,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// decoration: task.isDone! ? TextDecoration.lineThrough: null
// ),
// ),
// trailing: Checkbox(
// value: task.isDone,
// onChanged: task.isDeleted == false ? (value){
// context.read<TasksBloc>().add(UpdateTask(task: task));
// }: null,
// ),
// onLongPress: ,
// )