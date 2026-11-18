import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:untitled/ui/todo_api/my_todo_page.dart';

void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(MaterialApp(home: MyTodoPage()));
}