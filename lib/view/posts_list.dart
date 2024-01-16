import 'package:flutter/material.dart';
import 'package:flutter_ui/models/post.dart';
import 'package:flutter_ui/widgets/post_list_item.dart';

class PostsList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PostsListState();
  }
}

class _PostsListState extends State<PostsList>{
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text('List Post'),
    // );
    return ListView.builder(
      itemCount: list_post.length,
      itemBuilder: (BuildContext context, int index){
        return PostListItem(list_post[index]);
      },
    );
  }
}