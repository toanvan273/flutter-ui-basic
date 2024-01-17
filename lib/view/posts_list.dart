import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/post_bloc.dart';
import 'package:flutter_ui/events/post_event.dart';
import 'package:flutter_ui/models/post.dart';
import 'package:flutter_ui/states/post_state.dart';
import 'package:flutter_ui/widgets/bottom_loader.dart';
import 'package:flutter_ui/widgets/post_list_item.dart';

class PostsList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PostsListState();
  }
}

class _PostsListState extends State<PostsList>{
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll(){
    if(_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if(!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll*0.9);
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state){
        switch (state.status){
          case PostStatus.failure:
            return Center(child: Text('Fail to fetch data'),);
          case PostStatus.success:
            if(state.posts.isEmpty){
              return Center(child: Text('No data'));
            }
            return ListView.builder(
              itemCount: state.hasReachedMax?state.posts.length:state.posts.length + 1,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index){
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(state.posts[index]);
              },
            );
          case PostStatus.initial:
            return const Center(child: BottomLoader());
        }
      },
    );
  }
}