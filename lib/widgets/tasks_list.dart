
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/widgets/task_tile.dart';

class TasksList extends StatelessWidget{
  const TasksList({
    Key? key,
    required this.tasksList,
    required this.idScreen
  }):super(key: key);

  final List<Task> tasksList;
  final String idScreen;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context,index){
          var task = tasksList[index];
          return TaskTile(task: task, idScreen: idScreen);
        }));
  }
}

