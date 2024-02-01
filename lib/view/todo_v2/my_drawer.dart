
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/switch_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/switch_event.dart';
import 'package:flutter_ui/states/switch_state.dart';
import 'package:flutter_ui/states/tasks_state.dart';
import 'package:flutter_ui/ui_catalog/MyCatalog.dart';
import 'package:flutter_ui/view/comment_screen.dart';
import 'package:flutter_ui/view/posts_screen.dart';
import 'package:flutter_ui/view/todo/todo_main.dart';
import 'package:flutter_ui/view/todo_v2/recycle_bin.dart';
import 'package:flutter_ui/view/todo_v2/tabs_screen.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.green,
            child: Text('Task Drawer', style: Theme.of(context).textTheme.headlineMedium,),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context,state){
              return GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                child: ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context,state){
              return GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(PostsScreen.id),
            child: const ListTile(
              leading: Icon(Icons.document_scanner_sharp),
              title: Text('Post List'),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(CommentScreen.id),
            child: const ListTile(
              leading: Icon(Icons.post_add_sharp),
              title: Text('Comment List'),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(MainTodoScreen.id),
            child: const ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('Todo v1'),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(MyCatalog.id),
            child: const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My Catalog'),
            ),
          ),
          const Divider(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context,state){
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue){
                    newValue!
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  }
              );
            },
          ),
        ],
      ),
    )
    );
  }
}