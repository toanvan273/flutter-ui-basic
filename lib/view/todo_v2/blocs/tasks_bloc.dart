
import 'dart:ui';

import 'package:flutter_ui/view/todo_v2/blocs/tasks_event.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_state.dart';
import 'package:flutter_ui/view/todo_v2/completed_screen.dart';
import 'package:flutter_ui/view/todo_v2/favorite_screen.dart';
import 'package:flutter_ui/view/todo_v2/pending_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../models/task.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState>{
  TasksBloc():super(const TasksState()){
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit){
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if(event.task.isDone == false){
      final int index = pendingTasks.indexWhere((e) => e.id == event.task.id);
      pendingTasks = List.from(pendingTasks)..removeAt(index)..insert(index, event.task);
      if(event.task.isFavorite == true){
        final int favoriteIndex = favoriteTasks.indexWhere((e) => e.id == event.task.id);
        favoriteTasks = List.from(favoriteTasks)..removeAt(favoriteIndex)..insert(favoriteIndex, event.task);
      }
    }else{
      final int index = completedTasks.indexWhere((e) => e.id == event.task.id);
      completedTasks = List.from(completedTasks)..removeAt(index)..insert(index, event.task);
      if(event.task.isFavorite == true){
        final int favoriteIndex = favoriteTasks.indexWhere((e) => e.id == event.task.id);
        favoriteTasks = List.from(favoriteTasks)..removeAt(favoriteIndex)..insert(favoriteIndex, event.task);
      }
    }
    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks
    ));
  }

  void _onMarkFavoriteOrUnfavoriteTask(MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit){
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if(event.task.isDone == false){
      final int index = pendingTasks.indexWhere((e) => e.id == event.task.id);
      if(event.task.isFavorite == false){
        pendingTasks = List.from(pendingTasks)..removeAt(index)..insert(index, event.task.copyWith(isFavorite:true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      }else{
        pendingTasks = List.from(pendingTasks)..removeAt(index)..insert(index, event.task.copyWith(isFavorite:false));
        favoriteTasks.remove(event.task);
      }
    }else{
      final int index = completedTasks.indexWhere((e) => e.id == event.task.id);
      if(event.task.isFavorite == false){
        completedTasks = List.of(completedTasks)..removeAt(index)
          ..insert(index, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      }else{
        completedTasks = List.of(completedTasks)..removeAt(index)
          ..insert(index, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }
    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks
    ));
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
    List<Task> pendingTasks = List<Task>.from(state.pendingTasks);
    List<Task> completedTasks = List<Task>.from(state.completedTasks);
    List<Task> favoriteTasks = List<Task>.from(state.favoriteTasks);
    switch (event.idScreen){
      case PendingTasksScreen.id:
        final int index = state.pendingTasks.indexWhere((e) => e.id == event.task.id);
        pendingTasks.removeAt(index);
        break;
      case CompletedTasksScreen.id:
        final int index = state.completedTasks.indexWhere((e) => e.id == event.task.id);
        completedTasks.removeAt(index);
        break;
      case FavoriteTasksScreen.id:
        final int index = state.favoriteTasks.indexWhere((e) => e.id == event.task.id);
        favoriteTasks.removeAt(index);
        break;
      default:
        break;
    }
    emit(TasksState(
      removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true)),
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit){ //at Bin
    final int index = state.removedTasks.indexWhere((e) => e.id == event.task.id);
      List<Task> removedTasks = List.from(state.removedTasks)..removeAt(index);
      emit(TasksState(
        removedTasks: removedTasks,
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks
      ));
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














