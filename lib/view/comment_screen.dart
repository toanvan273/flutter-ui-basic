import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/comment_bloc.dart';
import 'package:flutter_ui/events/comment_event.dart';
import 'package:flutter_ui/states/comment_state.dart';
import 'package:flutter_ui/view/todo_v2/my_drawer.dart';


class CommentScreen extends StatefulWidget {
  static const id = 'comments_screen';

  @override
  State<StatefulWidget> createState() {
    return _InfiniteList();
  }
}

class _InfiniteList extends State<CommentScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        context.read<CommentBloc>().add(CommentFetchedEvent());
      };
    });
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment Page'),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state){
            if(state.status == CommentStatus.initial){
              return const Center(child: CircularProgressIndicator());
            }
            if(state.status == CommentStatus.initial){
              return const Center(
                child: Text('Cannot load comments from Server', style: TextStyle(fontSize: 22, color: Colors.redAccent),),
              );
            }
            if(state.status == CommentStatus.success){
              if(state.comments.isEmpty){
                return const Center(child: Text('Empty comments'));
              }
              return ListView.builder(
                itemBuilder: (BuildContext buildContext,int index){
                  if(index >= state.comments.length){
                    return Container(
                      alignment: Alignment.center,
                      child: const Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                    );
                  }else{
                    return ListTile(
                      leading: Text('${state.comments[index].id}'),
                      title: Text(
                          'email: ${state.comments[index].email}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      isThreeLine: true,
                      subtitle: Text(
                          state.comments[index].body
                      ),
                    );
                  }
                },
                itemCount: state.hasReachedEnd? state.comments.length:state.comments.length+1,
                controller:_scrollController,
              );
            }
            return const Center(child: Text('Empty comments'));
          },
        ),
      ),
    );
  }
}