
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

  void _onAddTask(AddTask event, Emitter<TasksState> emit) async {
    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      removedTasks: state.removedTasks,
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit){
      final task = event.task;
      List<Task> pendingTasks = List.from(state.pendingTasks);
      List<Task> completedTasks = List.from(state.completedTasks);
      if(task.isDone == false){
        final int index = state.pendingTasks.indexWhere((e) => e.id == task.id);
        completedTasks.add(task.copyWith(isDone: true));
        pendingTasks.removeAt(index);
      }else{
        final int index = state.completedTasks.indexWhere((e) => e.id == task.id);
        completedTasks.removeAt(index);
        pendingTasks.add(task.copyWith(isDone: false));
      }
      emit(TasksState(
          pendingTasks: pendingTasks,
          completedTasks: completedTasks,
          removedTasks: state.removedTasks,
          favoriteTasks: state.favoriteTasks
      ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit){
    // final int index = state.allTasks.indexWhere((e) => e.id == event.task.id);
    // List<Task> allTask = List.from(state.allTasks)..removeAt(index);
    emit(TasksState(
        removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true))
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit){ //at Bin
    final int index = state.removedTasks.indexWhere((e) => e.id == event.task.id);
      List<Task> removedTasks = List.from(state.removedTasks)..removeAt(index);
      emit(TasksState(removedTasks: removedTasks));
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














