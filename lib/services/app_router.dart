import 'package:flutter/material.dart';
import 'package:flutter_ui/view/todo_v2/recycle_bin.dart';
import 'package:flutter_ui/view/todo_v2/tabs_screen.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_)=> TabsScreen());
      default:
        return null;
    }
  }
}