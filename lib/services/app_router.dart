import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/MyCatalog.dart';
import 'package:flutter_ui/view/comment_screen.dart';
import 'package:flutter_ui/view/posts_screen.dart';
import 'package:flutter_ui/view/todo/todo_main.dart';
import 'package:flutter_ui/view/todo_v2/recycle_bin.dart';
import 'package:flutter_ui/view/todo_v2/tabs_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_)=> TabsScreen());
      case PostsScreen.id:
        return MaterialPageRoute(builder: (_) => PostsScreen());
      case CommentScreen.id:
        return MaterialPageRoute(builder: (_) => CommentScreen());
      case MainTodoScreen.id:
        return MaterialPageRoute(builder: (_) => MainTodoScreen());
      case MyCatalog.id:
        return MaterialPageRoute(builder: (_) => MyCatalog());
      default:
        return null;
    }
  }
}