
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/view/todo_v2/widgets/task_tile.dart';
import 'package:collection/collection.dart';

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
    // print(tasksList);
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList.mapIndexed((index, task){
           return ExpansionPanelRadio(
               value: task.id+index.toString(),
               headerBuilder: (context, isOpen) => TaskTile(task: task, idScreen: idScreen),
               body: ListTile(
                 title: SelectableText.rich(TextSpan(children: [
                   const TextSpan(
                       text: 'Text\n',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                       )
                   ),
                   TextSpan(text: task.title),
                   const TextSpan(
                       text: 'n\n\ Description\n',
                       style: TextStyle(
                           fontWeight: FontWeight.bold
                       )
                   ),
                   TextSpan(text: task.description)
                 ])),
               )
           );
          }
          ).toList(),
        ),
      ),
    );
  }
}


















// Expanded(child: ListView.builder(
// itemCount: tasksList.length,
// itemBuilder: (context,index){
// var task = tasksList[index];
// return TaskTile(task: task, idScreen: idScreen);
// }));