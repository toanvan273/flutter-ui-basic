import 'package:equatable/equatable.dart';
import 'package:flutter_ui/models/comment.dart';

abstract class CommentState extends Equatable{
  const CommentState();
  @override
  List<Object?> get props => [];
}

class CommentStateInitial extends CommentState{}
class CommentStateFailure extends CommentState{}
class CommentStateSuccess extends CommentState{
  final List<Comment> comments;
  final bool hasReachedEnd;
  const CommentStateSuccess({
    required this.comments,
    required this.hasReachedEnd
  });
  @override
  String toString() {
    // TODO: implement toString
    return "comments: $comments, hasReachedEnd: $hasReachedEnd";
  }

  @override
  List<Object?> get props => [comments, hasReachedEnd];
  //cloneWith để nhân bản đối tượng CommentStateSuccess
  CommentStateSuccess cloneWith({
    List<Comment>? comments,
    bool? hasReachedEnd}) {
    return CommentStateSuccess(
        comments: comments ?? this.comments,
        hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd
    );
  }
}