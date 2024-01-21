import 'package:flutter_ui/constant/todo.dart';
import '../models/task_todo.dart';

class TodoState{
   List<TaskTodo> allTask;
   List<TaskTodo> filterTask;

  TodoState({
    this.allTask = const <TaskTodo>[],
    this.filterTask = const <TaskTodo>[],
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

  TodoState addTask(TaskTodo  taskTodo){
    var list = [...allTask, taskTodo];
    print('list: $list');
    return TodoState(allTask: [...list]);
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
}