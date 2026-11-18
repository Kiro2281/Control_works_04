import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/todo_model.dart';
import 'package:untitled/data/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository = TodoRepository();
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodoApiEvent>((event, emit) async {
        try{
          emit(LoadingTodoState());
          final TodoModel todoList = await _todoRepository.getTodoApi();
          emit(LoadedTodoState(list: todoList));
        } catch (error){
          emit(ErrorTodoState());
        }
    });
  }
}
