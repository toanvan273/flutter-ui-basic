

import 'package:flutter/material.dart';
import 'package:flutter_ui/view/todo_v2/add_tasks_screen.dart';
import 'package:flutter_ui/view/todo_v2/completed_screen.dart';
import 'package:flutter_ui/view/todo_v2/favorite_screen.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';
import 'package:flutter_ui/view/todo_v2/pending_screen.dart';

class TabsScreen extends StatefulWidget{
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasksScreen(), 'title':'Pedding Tasks'},
    {'pageName': CompletedTasksScreen(), 'title':'Completed Tasks'},
    {'pageName': FavoriteTasksScreen(), 'title':'Favorite Tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: AddTaskScreen(),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0 ? FloatingActionButton(
        onPressed: ()=> _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ): null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index){
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Pendding Task'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'Completed Task'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite Task'
          ),
        ],
      ),
    );
  }
}















