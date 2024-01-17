import 'package:flutter_ui/models/post.dart';

enum PostStatus {
  initial,
  success,
  failure
}

final class PostState{
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false
});

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax
  }){
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length} }''';
  }
}