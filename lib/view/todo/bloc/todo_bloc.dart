import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/view/todo/bloc/todo_event.dart';
import 'package:flutter_ui/view/todo/bloc/todo_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState>{
  TodoBloc():super(TodoState(allTask: const [])){
    on<TodoAddEvent>(_addTaskTodo);
    on<TodoFilterEvent>(_filterTaskTodo);
    on<TodoMarkCompleteEvent>((event,emit){});
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