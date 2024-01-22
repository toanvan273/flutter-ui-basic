import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/todo_bloc.dart';
import 'package:flutter_ui/view/todo/add_todo.dart';
import 'package:flutter_ui/view/todo/result_page.dart';
import 'package:flutter_ui/view/todo/todo_page.dart';

class TodoMainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (BuildContext context) => TodoBloc(),
      child: MainTodo(),
    );
  }
}
class MainTodo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainTodoState();
  }
}
class _MainTodoState extends State<MainTodo>{
  int _selectedPageIndex = 0;
  List<Map<String,Object>>? _pages;
  @override
  void initState() {
    _pages = [
      {'page': TodoPage()},
      {'page': ResultPage()}
    ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  Widget _createBottomNavigatioBar(){
    return Container(
      padding: EdgeInsets.only(top:10),
      child: BottomNavigationBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        selectedItemColor: Colors.deepOrange,
        unselectedIconTheme:
        IconThemeData(color: Color.fromRGBO(171, 178, 162, 1)),
        unselectedItemColor: Color.fromARGB(171, 178, 162, 1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
        unselectedFontSize: 11,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'List',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_rounded),
              label: 'Result',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        extendBody: true,
        bottomNavigationBar: _createBottomNavigatioBar(),
        body: _pages![_selectedPageIndex]['page'] as Widget,
        floatingActionButton: Builder(builder: (context){
              return FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTodo())
                  );
                },
                tooltip: 'Create',
                child: const Icon(Icons.add),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                ),
              );
            }
        ),
      ),
    );
  }
}