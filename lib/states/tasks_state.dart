import 'package:equatable/equatable.dart';
import 'package:flutter_ui/models/task.dart';

class TasksState extends Equatable{

  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTasks = const <Task>[]
  });


  int get totalTasks {
    return pendingTasks.length + completedTasks.length + favoriteTasks.length;
  }
  @override
  List<Object?> get props => [removedTasks, pendingTasks, completedTasks,favoriteTasks];

  Map<String, dynamic> toMap() {
    return {
      'pendingTasks': pendingTasks.map((e) => e.toMap()).toList(),
      'completedTasks': completedTasks.map((e) => e.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks:  List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
      completedTasks:  List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
      favoriteTasks:  List<Task>.from(map['favoriteTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:  List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}