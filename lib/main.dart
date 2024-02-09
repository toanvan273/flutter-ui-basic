import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/comment_bloc.dart';
import 'package:flutter_ui/blocs/post_bloc.dart';
import 'package:flutter_ui/blocs/switch_bloc.dart';
import 'package:flutter_ui/view/todo/todo_main.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_bloc.dart';
import 'package:flutter_ui/view/todo/bloc/todo_bloc.dart';
import 'package:flutter_ui/events/comment_event.dart';
import 'package:flutter_ui/events/post_event.dart';
import 'package:flutter_ui/services/app_router.dart';
import 'package:flutter_ui/services/app_theme.dart';
import 'package:flutter_ui/states/switch_state.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_bloc.dart';
// import 'package:flutter_ui/view/todo_v2/tabs_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>(
              create: (BuildContext context) => TasksBloc()
          ),
          BlocProvider<SwitchBloc>(
            create: (BuildContext context) => SwitchBloc(),
          ),
          BlocProvider<PostBloc>(
            create: (context) => PostBloc(httpClient: http.Client())..add(PostFetched()),
          ),
          BlocProvider<CommentBloc>(
            create: (BuildContext context) => CommentBloc()..add(CommentFetchedEvent()),
          ),
          BlocProvider<TodoBloc>(
            create: (context) => TodoBloc(),
          ),
          BlocProvider<DrinkBloc>(
            create: (context) => DrinkBloc(),
          )
        ],
        child: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context,state){
            return MaterialApp(
              title: 'Flutter App',
              theme: state.switchValue! ?
              AppThemes.appThemeData[AppTheme.darkTheme]:
              AppThemes.appThemeData[AppTheme.lightTheme],
              home: MainTodoScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        )
    );
  }
}