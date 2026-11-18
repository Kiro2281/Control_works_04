part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class LoadTodoApiEvent extends TodoEvent {}
