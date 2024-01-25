import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/events/todo_event.dart';
import 'package:flutter_ui/models/task_todo.dart';
import 'package:flutter_ui/states/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  TodoBloc():super(TodoState(allTask: const [])){
    on<TodoAddEvent>((event,emit){
      print('Bloc: ${event.taskTodo}');
      print('Bloc_state: ${state.allTask} ');
      List<TaskTodo> all = [...state.allTask, event.taskTodo];
      print('all: $all');
      state.addTask(taskTodo: event.taskTodo);
      // state.copyWith(allTask: all);
    });
    on<TodoFilterEvent>((event,emit){});
    on<TodoMarkCompleteEvent>((event,emit){});
  }
}