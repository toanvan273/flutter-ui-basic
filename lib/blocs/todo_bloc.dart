import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/events/todo_event.dart';
import 'package:flutter_ui/states/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  TodoBloc():super(TodoState()){
    on<TodoAddEvent>((event,emit){
      print('$event  + ${event.taskTodo}');
      state.addTask(event.taskTodo);
    });
    on<TodoFilterEvent>((event,emit){});
    on<TodoMarkCompleteEvent>((event,emit){});
  }
}