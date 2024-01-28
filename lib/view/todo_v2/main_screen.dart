
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/switch_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/services/app_router.dart';
import 'package:flutter_ui/services/app_theme.dart';
import 'package:flutter_ui/states/switch_state.dart';
import 'package:flutter_ui/view/todo_v2/pending_screen.dart';
import 'package:flutter_ui/view/todo_v2/tabs_screen.dart';

class MyTasksApp extends StatelessWidget{
  const MyTasksApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>(
              create: (BuildContext context) => TasksBloc()
          ),
          BlocProvider<SwitchBloc>(
            create: (BuildContext context) => SwitchBloc(),
          )
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context,state){
            return MaterialApp(
              title: 'Flutter App',
              theme: state.switchValue! ?
              AppThemes.appThemeData[AppTheme.darkTheme]:
              AppThemes.appThemeData[AppTheme.lightTheme],
              home: TabsScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        )
    );
  }
}
