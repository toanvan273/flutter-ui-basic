import 'package:flutter/material.dart';
import 'package:flutter_ui/view/movie/home_screen.dart';
import 'package:flutter_ui/view/movie/search_screen.dart';
import 'package:flutter_ui/view/movie/trending_screen.dart';

class MenuMovie extends StatefulWidget{
  static const id = 'menu_movie_screen';
  @override
  State<StatefulWidget> createState() {
    return _MenuMovie();
  }
}

class _MenuMovie extends State<MenuMovie> {
  final List<Map<String, dynamic>> _pages = [
    {'pageName': HomeMovie()},
    {'pageName': TrendingMovie()},
    {'pageName': SearchMovie()}
  ];
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex]['pageName'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepOrange,
        onTap: (i){
          setState(() {
            _pageIndex = i;
          });
        },
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Trending'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Search'
          ),
        ],
      ),
    );
  }
}