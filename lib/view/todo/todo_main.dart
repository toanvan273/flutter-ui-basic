import 'package:flutter/material.dart';
import 'package:flutter_ui/view/todo/add_todo.dart';
import 'package:flutter_ui/view/todo/result_page.dart';
import 'package:flutter_ui/view/todo/todo_page.dart';

class MainTodoScreen extends StatefulWidget{
  static const id = 'main_todo_v1_screen';

  const MainTodoScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MainTodoState();
  }
}
class _MainTodoState extends State<MainTodoScreen>{
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
    return Scaffold(
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
          ),
          child: const Icon(Icons.add),
        );
      }
      ),
    );
  }
}