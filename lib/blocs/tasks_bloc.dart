
import 'package:flutter_ui/events/tasks_event.dart';
import 'package:flutter_ui/states/tasks_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/task.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState>{
  TasksBloc():super(const TasksState()){
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }


Future<void> _onAddTask(AddTask event, Emitter<TasksState> emit) async {
  emit(TasksState(
    allTasks: List.from(state.allTasks)..add(event.task),
    removedTasks: state.removedTasks
  ));
}

void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit){
    final task = event.task;
    final int index = state.allTasks.indexWhere((e) => e.id == task.id);
    List<Task> allTask = List.from(state.allTasks)..removeAt(index);
    task.isDone == false
      ? allTask.insert(index,task.copyWith(isDone: true))
      : allTask.insert(index,task.copyWith(isDone: false));
    emit(TasksState(
      allTasks: allTask,
      removedTasks: state.removedTasks
    ));
}

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit){
    final int index = state.allTasks.indexWhere((e) => e.id == event.task.id);
    List<Task> allTask = List.from(state.allTasks)..removeAt(index);
    emit(TasksState(
        allTasks: allTask,
        removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true))
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit){ //at Bin
    final int index = state.removedTasks.indexWhere((e) => e.id == event.task.id);
      List<Task> removedTasks = List.from(state.removedTasks)..removeAt(index);
      emit(TasksState(allTasks: state.allTasks, removedTasks: removedTasks));
  }



  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }

}














