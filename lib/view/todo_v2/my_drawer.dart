
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/switch_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/switch_event.dart';
import 'package:flutter_ui/states/switch_state.dart';
import 'package:flutter_ui/states/tasks_state.dart';
import 'package:flutter_ui/view/todo_v2/recycle_bin.dart';
import 'package:flutter_ui/view/todo_v2/pending_screen.dart';
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
                  trailing: Text('${state.allTasks.length}'),
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
          )
        ],
      ),
    )
    );
  }
}