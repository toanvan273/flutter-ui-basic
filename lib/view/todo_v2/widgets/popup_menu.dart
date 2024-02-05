
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/task.dart';

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  final Task task;
  const PopupMenu({
    super.key,
    required this.task,
    required this.cancelOrDeleteCallback
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
                icon: const Icon(Icons.bookmark),
                label: const Text('Add to bookmarks')
            ),
            onTap: (){},
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
