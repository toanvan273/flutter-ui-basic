import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/events/comment_event.dart';
import 'package:flutter_ui/services/services.dart';
import 'package:flutter_ui/states/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>{
  final NUMBER_OF_COMMENTS_PER_PAGE = 20;
  //init state
  CommentBloc():super(CommentStateInitial());
  Stream<CommentState> mapEventToState(CommentEvent event) async*{
    // check if "has reached end of page"
    final hasReachedEndOfOnePage = (state is CommentStateSuccess && (state as CommentStateSuccess).hasReachedEnd);
    try{
      if(event is CommentFetchedEvent && !hasReachedEndOfOnePage){
        if(state is CommentStateInitial){
          //first time loading page
          //1. get comments from API
          //2.yield CommentStateSuccess
          final comments = await getCommentsFromApi(0, NUMBER_OF_COMMENTS_PER_PAGE);
          yield CommentStateSuccess(
              comments: comments,
              hasReachedEnd: false
          );
        }else if(state is CommentStateSuccess){
          //load next page
          //if "next page is empty" => yield "CommentStateSuccess" with hasReachedEnd = true
          final currentState = state as CommentStateSuccess;
          int finalIndexOfCurrentPage = (state as CommentStateSuccess).comments.length;
          final comments = await getCommentsFromApi(finalIndexOfCurrentPage, NUMBER_OF_COMMENTS_PER_PAGE);
          if(comments.isEmpty){
            // change current state!
            yield currentState.cloneWith(hasReachedEnd: true);
          }else{
            // not empty, means "not reached end"
            yield CommentStateSuccess(
                comments: currentState.comments + comments, // concat 2 arrays
                hasReachedEnd: false
            );
          }
        }
      }
    }catch(exeption){
      yield CommentStateFailure();
    }
  }
}