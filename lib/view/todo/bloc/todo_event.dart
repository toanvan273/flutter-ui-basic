import 'package:flutter_ui/constant/todo.dart';
import 'package:flutter_ui/models/task_todo.dart';

abstract class TodoEvent{}

final class TodoAddEvent extends TodoEvent{
  TaskTodo taskTodo;
  TodoAddEvent(this.taskTodo);
}

final class TodoUpdateEvent extends TodoEvent{
  TaskTodo taskTodo;
  TodoUpdateEvent(this.taskTodo);
}

final class TodoFilterEvent extends TodoEvent{
  FilterItem filterItem;
  TodoFilterEvent({required this.filterItem});
}

final class TodoMarkCompleteEvent extends TodoEvent{
  MarkComplete markComplete;
  TodoMarkCompleteEvent(this.markComplete);
}