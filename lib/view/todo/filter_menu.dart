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
    // return MenuAnchor(
    //   builder: (BuildContext context, MenuController controller, Widget? child){
    //     return IconButton(
    //         onPressed: (){
    //           if(controller.isOpen){
    //             controller.close();
    //           }else{
    //             controller.open();
    //           }
    //         },
    //         icon: Icon(Icons.filter_list_rounded)
    //     );
    //   },
    //   menuChildren: [
    //     InkWell(
    //       child: Text('Show all'),
    //       onTap: (){
    //         setState(() {
    //           filterItem = FilterItem.all;
    //         });
    //       },
    //     ),
    //     InkWell(
    //       child: Text('Show active'),
    //       onTap: (){
    //         setState(() {
    //           filterItem = FilterItem.active;
    //         });
    //       },
    //     ),
    //     InkWell(
    //       child: Text('Show completed'),
    //       onTap: (){
    //         setState(() {
    //           filterItem = FilterItem.completed;
    //         });
    //       },
    //     )
    //   ],
    // );
  }
}





class MarkCompleteMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MarkCompleteMenu();
  }
}

class _MarkCompleteMenu extends State<MarkCompleteMenu>{
  MarkComplete? markComplete;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context)=> [
        PopupMenuItem(
          onTap: (){},
          child: Text('Mark all complete'),
        ),
        PopupMenuItem(
          onTap: (){},
          child: Text('Clear all completed'),
        )
      ]),
        icon: Icon(Icons.more_horiz)
    );
    // return MenuAnchor(
    //   builder: (BuildContext context, MenuController controller, Widget? child){
    //     return IconButton(
    //         onPressed: (){
    //           if(controller.isOpen){
    //             controller.close();
    //           }else{
    //             controller.open();
    //           }
    //         },
    //         icon: Icon(Icons.more_horiz)
    //     );
    //   },
    //   menuChildren: [
    //     InkWell(
    //       child: Text('Mark all complete'),
    //       onTap: (){
    //         setState(() {
    //           markComplete = MarkComplete.markAll;
    //         });
    //       },
    //     ),
    //     InkWell(
    //       child: Text('Clear all completed'),
    //       onTap: (){
    //         setState(() {
    //           markComplete = MarkComplete.clearAll;
    //         });
    //       },
    //     ),
    //   ],
    // );
  }
}