import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class CommentFetchedEvent extends CommentEvent {}

class Credentials extends Equatable {
  const Credentials({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];

  @override
  bool get stringify => false;
}

class EquatableDateTime extends DateTime with EquatableMixin {
  EquatableDateTime(
      int year, [
        int month = 1,
        int day = 1,
        int hour = 0,
        int minute = 0,
        int second = 0,
        int millisecond = 0,
        int microsecond = 0,
      ]) : super(year, month, day, hour, minute, second, millisecond, microsecond);

  @override
  List<Object> get props {
    return [year, month, day, hour, minute, second, millisecond, microsecond];
  }

  @override
  bool get stringify => true;
}