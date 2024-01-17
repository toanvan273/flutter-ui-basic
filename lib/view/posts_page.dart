import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/post_bloc.dart';
import 'package:flutter_ui/events/post_event.dart';
import 'package:flutter_ui/view/posts_list.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostBloc(httpClient: http.Client())..add(PostFetched()),
      child: MaterialApp(
        home: Scaffold(
          body: PostsList(),
        ),
      ),
    );
  }
}