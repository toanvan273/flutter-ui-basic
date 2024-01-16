import 'package:flutter/material.dart';
import 'package:flutter_ui/models/post.dart';

class PostListItem extends StatelessWidget{
  final Post post;

  PostListItem(this.post);
  @override
  Widget build(BuildContext context) {
    print(post.toString());
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.bodySmall,),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}