import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/constant/todo.dart';
import 'package:flutter_ui/view/todo/bloc/todo_bloc.dart';
import 'package:flutter_ui/view/todo/bloc/todo_event.dart';


List<Map<String, dynamic>> listFilter = [];

class FilterMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context)=> [
        PopupMenuItem(
          onTap: () => context.read<TodoBloc>().add(TodoFilterEvent(filterItem: FilterItem.all)),
          child: Text('Show all'),
        ),
        PopupMenuItem(
          onTap: () => context.read<TodoBloc>().add(TodoFilterEvent(filterItem: FilterItem.active)),
          child: Text('Show active'),
        ),
        PopupMenuItem(
          onTap: () => context.read<TodoBloc>().add(TodoFilterEvent(filterItem: FilterItem.completed)),
          child: Text('Show completed'),
        )
      ]),
      icon: Icon(Icons.filter_list_rounded),
    );

  }
}





class MarkCompleteMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context)=> [
        PopupMenuItem(
          onTap: () => context.read<TodoBloc>().add(TodoMarkCompleteEvent(MarkComplete.markAll)),
          child: Text('Mark all complete'),
        ),
        PopupMenuItem(
          onTap: () => context.read<TodoBloc>().add(TodoMarkCompleteEvent(MarkComplete.clearAll)),
          child: Text('Clear all completed'),
        )
      ]),
        icon: Icon(Icons.more_horiz)
    );
  }
}