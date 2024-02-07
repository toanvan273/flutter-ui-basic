import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    String? description,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite
  }) {
    return Task(
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        id: id ?? this.id,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted,
        isFavorite: isFavorite ?? this.isFavorite
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite
    };
  }


  @override
  List<Object?> get props => [title,description, isDone, isDeleted, id, isFavorite];

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ,
      description: map['description'],
      date: map['date'],
      id: map['id'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite']
    );
  }

  @override
  String toString() {
    return 'Task{title: $title description: $description isDone: $isDone isDeleted: $isDeleted id: $id} date: $date isFavorite: $isFavorite';
  }
}
