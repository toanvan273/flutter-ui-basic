import 'package:equatable/equatable.dart';
import 'package:flutter_ui/models/task.dart';

abstract class TasksEvent extends Equatable{
  const TasksEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AddTask extends TasksEvent{
  final Task task;

  AddTask({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class UpdateTask extends TasksEvent{
  final Task task;

  UpdateTask({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class DeleteTask extends TasksEvent{
  final Task task;
  DeleteTask({required this.task});
  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TasksEvent{
  final Task task;
  RemoveTask({required this.task});
  @override
  List<Object?> get props => [task];
}