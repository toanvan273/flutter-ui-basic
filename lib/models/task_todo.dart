import 'package:flutter_ui/services/services.dart';

class TaskTodo {
  String id;
  String title;
  String content;
  bool completed;

  TaskTodo({
   required this.id,
    required this.title,
    required this.content,
    this.completed = false
});
  @override
  String toString() {
    // TODO: implement toString
    return 'Task{ id: $id title: $title content: $content}';
  }
}

List<TaskTodo> listTodo = <TaskTodo>[
  TaskTodo(id: '1A', title: "ABCD", content:'Contet'),
  TaskTodo(id: '2A', title: "ABCD", content:'Contet'),
  TaskTodo(id: '3A', title: "ABCD", content:'Contet'),
  TaskTodo(id: '4A', title: "ABCD", content:'Contet'),
  TaskTodo(id: '5A', title: "ABCD", content:'Contet'),
  TaskTodo(id: '6A', title: "ABCD", content:'Contet'),
];