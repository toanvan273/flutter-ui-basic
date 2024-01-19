import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Todos'),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.filter_list_rounded)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_horiz)
            )
          ],
        ),
        body: Center(child: Text('Todo Page'),),
        bottomNavigationBar: _BottomAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Create',
          child: const Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: IconTheme(
        data: IconThemeData(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.list_rounded)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.show_chart_rounded)
            )
          ],
        ),
      ),
    );
  }
}









