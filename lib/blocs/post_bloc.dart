import 'dart:convert';
import 'package:flutter_ui/events/post_event.dart';
import 'package:flutter_ui/models/post.dart';
import 'package:flutter_ui/states/post_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

const _postLimit = 15;
const throttleDuration = Duration(milliseconds: 100);

class PostBloc extends Bloc<PostEvent, PostState>{
  PostBloc({required this.httpClient}):super(const PostState()){
    on<PostFetched>(_onPostFetched);
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(PostFetched event,Emitter<PostState> emit) async {
    if(state.hasReachedMax) return;
    try{
      if(state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false
          )
        );
      }
      // print('length--post: ${state.posts.length}');
      int totalItem = state.posts.length;
      print('totalItem $totalItem');
      final posts = await _fetchPosts(totalItem);
      return posts.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(
          state.copyWith(
            status: PostStatus.success,
            posts: List.of(state.posts)..addAll(posts),
            hasReachedMax: false
          )
        );
    }catch (_){
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    // print('startIndex: $startIndex');
    final response = await httpClient.get(Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
    ));

    if(response.statusCode == 200){
      final body = json.decode(response.body) as List;
      return body.map((dynamic json){
        final map = json as Map<String, dynamic>;
        return Post(
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}