import 'package:flutter_ui/models/comment.dart';

enum CommentStatus {
  initial,
  failure,
  success
}

class CommentState{
  final CommentStatus status;
  final List<Comment> comments;
  final bool hasReachedEnd;

  const CommentState({
    this.status = CommentStatus.initial,
    this.comments = const <Comment>[],
    this.hasReachedEnd = false
  });

  CommentState copyWith({
    CommentStatus? status,
    List<Comment>? comments,
    bool? hasReachedEnd
  }){
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd
    );
  }


  @override
  String toString() {
    return 'State: status=$status hasReachedEnd=$hasReachedEnd comments=$comments';
  }

}

// class CommentStateInitial extends CommentState{}
// class CommentStateFailure extends CommentState{}
// class CommentStateSuccess extends CommentState{
//   final List<Comment> comments;
//   final bool hasReachedEnd;
//   const CommentStateSuccess({
//     required this.comments,
//     required this.hasReachedEnd
//   });
//
//   @override
//   String toString() {
//     return "comments: $comments, hasReachedEnd: $hasReachedEnd";
//   }
//
//   @override
//   List<Object?> get props => [comments, hasReachedEnd];
//   //cloneWith để nhân bản đối tượng CommentStateSuccess
//   CommentStateSuccess cloneWith({
//     List<Comment>? comments,
//     bool? hasReachedEnd}) {
//     return CommentStateSuccess(
//         comments: comments ?? this.comments,
//         hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd
//     );
//   }
// }