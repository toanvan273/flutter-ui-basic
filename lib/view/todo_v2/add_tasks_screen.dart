
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/blocs/tasks_bloc.dart';
import 'package:flutter_ui/events/tasks_event.dart';
import 'package:flutter_ui/models/task.dart';
import 'package:flutter_ui/services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget{
  AddTaskScreen({Key? key,}):super(key: key);
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        const Text('Add Task', style: TextStyle(fontSize: 24),),
        const SizedBox(height: 10,),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
              label: Text('label'),
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
            SizedBox(width: 20,),
            ElevatedButton(
                onPressed: (){
                  var task = Task(
                      title: titleController.text,
                    id: GUIDGen.generate()
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
