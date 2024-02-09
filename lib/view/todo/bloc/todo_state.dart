import 'package:equatable/equatable.dart';
import 'package:flutter_ui/constant/todo.dart';
import '../../../models/task_todo.dart';

class TodoState extends Equatable{
   List<TaskTodo> allTask;
   FilterItem? filter;

  TodoState({
    this.allTask = const <TaskTodo>[],
    this.filter
  });

  TodoState copyWith({
    List<TaskTodo>? allTask,
    List<TaskTodo>? filterTask,
  }){
    return TodoState(
      allTask: allTask ?? this.allTask,
      filter: filter ?? this.filter
    );
  }

  int get totalTask {
    return allTask.length;
  }


  @override
  String toString() {
    return 'allTask: ${allTask} || filterTask: ${filter}';
  }

  @override
  List<Object?> get props => [allTask, filter];

  factory TodoState.fromJson(Map<String, dynamic> json) {
    // print('check json $json');
    return TodoState(
      allTask: List<TaskTodo>.from(json['allTask']?.map((x)=> TaskTodo.fromJson(x))),
      filter: json['filter'] != null?
      FilterItem.values.byName(json['filter']): null,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      "allTask": allTask.map((e) => e.toJson()).toList(),
      "filter": filter?.name,
    };
  }
}