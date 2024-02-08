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
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTask>(_onDeleteAllTask);
  }

  void _onDeleteAllTask(DeleteAllTask event, Emitter<TasksState> emit){
    emit(TasksState(
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: const [],
    ));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit){
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    List<Task> removedTasks = state.removedTasks;
    if(event.task.isDone == false){
      pendingTasks.insert(0, event.task.copyWith(isDeleted: false));
      if(event.task.isFavorite == true){
        favoriteTasks.insert(0, event.task.copyWith(isDeleted: false));
      }
    }else{
      completedTasks.insert(0, event.task.copyWith(isDeleted: false));
      if(event.task.isFavorite == true){
        favoriteTasks.insert(0, event.task.copyWith(isDeleted: false));
      }
    }
    final int index = removedTasks.indexWhere((e) => e.id == event.task.id);
    removedTasks = List.from(removedTasks)..removeAt(index);
    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: removedTasks
    ));
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
      List<Task> favoriteTasks = List.from(state.favoriteTasks);
      switch (event.idScreen){
        case PendingTasksScreen.id:
          final int index = state.pendingTasks.indexWhere((e) => e.id == task.id);
          pendingTasks.removeAt(index);
          completedTasks.add(task.copyWith(isDone: true));
          break;
        case CompletedTasksScreen.id:
          final int index = state.completedTasks.indexWhere((e) => e.id == task.id);
          completedTasks.removeAt(index);
          pendingTasks.add(task.copyWith(isDone: false));
          break;
        case FavoriteTasksScreen.id:
          final int indexFavorite = state.favoriteTasks.indexWhere((e) => e.id == task.id);
          favoriteTasks = List.from(favoriteTasks)
            ..removeAt(indexFavorite)
            ..insert(indexFavorite, task.copyWith(isDone: event.task.isDone == false ? true : false));
          break;
        default:
          break;
      }
      emit(TasksState(
          pendingTasks: pendingTasks,
          completedTasks: completedTasks,
          removedTasks: state.removedTasks,
          favoriteTasks: favoriteTasks
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














