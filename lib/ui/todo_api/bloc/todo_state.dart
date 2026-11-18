part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState {}

final class LoadedTodoState extends TodoState {
  new({required this.list});

  final TodoModel list;
}

final class ErrorTodoState extends TodoState {}
