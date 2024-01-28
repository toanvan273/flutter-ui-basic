import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, required this.id, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
        title: title ?? this.title,
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }


  @override
  List<Object?> get props => [title, isDone, isDeleted, id];

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  @override
  String toString() {
    return 'Task{title: $title isDone: $isDone isDeleted: $isDeleted id: $id}';
  }
}
