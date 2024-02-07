
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final Task task;
  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislike,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false ? ((context) => [
          PopupMenuItem(
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.edit),
                label: const Text('Edit')
            ),
            onTap: (){},
          ),
          PopupMenuItem(
            child: TextButton.icon(
                onPressed: null,
                icon: task.isFavorite == false
                    ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_remove),
                label: task.isFavorite == false
                    ? const Text('Add to bookmarks')
                    : const Text('Remove from bookmark')
            ),
            onTap: (){
              context.read<TasksBloc>().add(MarkFavoriteOrUnfavoriteTask(task: task));
            },
          ),
          PopupMenuItem(
            onTap: cancelOrDeleteCallback,
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete')
            ),
          )
        ]) : ((context) => [
          PopupMenuItem(
            onTap: (){},
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.restore),
                label: const Text('Restore')
            ),
          ),
          PopupMenuItem(
            onTap: cancelOrDeleteCallback,
            child: TextButton.icon(
                onPressed: null,
                icon: const Icon(Icons.delete_forever),
                label: const Text('Delete Forever')
            ),
          )
        ])
    );
  }
}
