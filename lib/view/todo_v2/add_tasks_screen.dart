
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget{
  AddTaskScreen({Key? key,}):super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        const Text('Add Task', style: TextStyle(fontSize: 24),),
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
                  var task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: GUIDGen.generate(),
                      date: DateTime.now().toString(),
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('add')
            )
          ],
        )
      ],
      ),
    );
  }
}
