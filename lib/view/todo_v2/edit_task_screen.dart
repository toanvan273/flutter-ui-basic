
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_bloc.dart';
import 'package:flutter_ui/view/todo_v2/blocs/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/services/guid_gen.dart';

class EditTaskScreen extends StatelessWidget{
  final Task oldTask;
  EditTaskScreen({Key? key,required this.oldTask}):super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: oldTask.title);
    TextEditingController descriptionController = TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        const Text('Edit Task', style: TextStyle(fontSize: 24),),
        const SizedBox(height: 10,),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder()
          ),
        ),
        const SizedBox(height: 10,),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
              label: Text('Description'),
              border: OutlineInputBorder()
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: ()=> Navigator.pop(context),
                child: const Text('cancel')
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
                onPressed: (){
                  var editedTask = Task(
                    title: titleController.text,
                    description: descriptionController.text,
                    id: oldTask.id,
                    date: DateTime.now().toString(),
                    isFavorite: oldTask.isFavorite
                  );
                  context.read<TasksBloc>().add(EditTask(task: editedTask));
                  Navigator.pop(context);
                },
                child: const Text('Save')
            )
          ],
        )
      ],
      ),
    );
  }
}
