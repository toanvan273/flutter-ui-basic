import 'package:equatable/equatable.dart';
import 'package:flutter_ui/constant/todo.dart';
import '../models/task_todo.dart';

class TodoState extends Equatable{
   List<TaskTodo> allTask;
   List<TaskTodo>? filterTask;

  TodoState({
    required this.allTask,
    this.filterTask,
  });

  TodoState copyWith({
    List<TaskTodo>? allTask,
    List<TaskTodo>? filterTask,
  }){
    return TodoState(
      allTask: allTask ?? this.allTask,
      filterTask: filterTask ?? this.filterTask
    );
  }

  TodoState addTask({required TaskTodo taskTodo}){
    if(taskTodo != null){
      var list = [...allTask, taskTodo];
      return TodoState(allTask: list, filterTask: filterTask);
    }
    return TodoState(allTask: allTask, filterTask: filterTask);
  }

  int get totalTask {
    return allTask.length;
  }
  List<TaskTodo> filterTodo(FilterItem filterItem){
    switch(filterItem){
      case FilterItem.all:
        return allTask;
      case FilterItem.active:
        return allTask.where((task) => task.completed == false).toList();
      case FilterItem.completed:
        return allTask.where((task) => task.completed).toList();
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'allTask: ${allTask} || filterTask: ${filterTask}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}