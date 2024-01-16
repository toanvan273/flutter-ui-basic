import 'package:flutter/material.dart';
import 'package:flutter_ui/view/posts_list.dart';

class PostsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PostsList(),
      ),
    );
  }
}