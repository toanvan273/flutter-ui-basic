import 'package:flutter_ui/constant/todo.dart';
import 'package:flutter_ui/models/task_todo.dart';
import 'package:flutter_ui/view/todo/bloc/todo_event.dart';
import 'package:flutter_ui/view/todo/bloc/todo_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState>{
  TodoBloc():super(TodoState(allTask: const [])){
    on<TodoAddEvent>(_addTaskTodo);
    on<TodoFilterEvent>(_filterTaskTodo);
    on<TodoUpdateEvent>(_updateTaskTodo);
    on<TodoMarkCompleteEvent>(_markCompleteTask);
  }

  void _markCompleteTask(TodoMarkCompleteEvent event, Emitter<TodoState> emit){
    List<TaskTodo> allTask = state.allTask;
    switch(event.markComplete){
      case MarkComplete.markAll:
        allTask = allTask.map((e) => e.copyWith(completed: true)).toList();
        break;
      case MarkComplete.clearAll:
        allTask = allTask.map((e) => e.copyWith(completed: false)).toList();
        break;
      default:
        break;
    }

    emit(TodoState(
      allTask: allTask,
      filter: null
    ));
  }

  void _updateTaskTodo(TodoUpdateEvent event,Emitter<TodoState> emit){
    final int index = state.allTask.indexWhere((e) => e.id == event.taskTodo.id);
    List<TaskTodo> allTasks = state.allTask;
    if(index>=0){
      allTasks = List.from(allTasks)..removeAt(index)
        ..insert(index, event.taskTodo.copyWith(completed: !event.taskTodo.completed));
    }
    emit(TodoState(
      allTask: allTasks,
      filter: state.filter
    ));
  }

  void _filterTaskTodo(TodoFilterEvent event, Emitter<TodoState> emit){
    emit(TodoState(
      allTask: state.allTask,
      filter: event.filterItem
    ));
  }

  void _addTaskTodo(TodoAddEvent event, Emitter<TodoState> emit){
    emit(TodoState(
      allTask: List.from(state.allTask)..add(event.taskTodo),
      filter: state.filter
    ));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }
}