import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/models/todo_model.dart';
import 'package:untitled/ui/todo_api/bloc/todo_bloc.dart';
import 'package:untitled/ui/todo_api/bloc/todo_bloc.dart';

class MyTodoPage extends StatefulWidget {
  const MyTodoPage({super.key});

  @override
  State<MyTodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  final TodoBloc _todoBloc = TodoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TodoBloc, TodoState>(
          bloc: _todoBloc,
          builder: (context, state) {
            if (state is ErrorTodoState) {
              return Text(
                'Ошибка',
                style: TextStyle(fontSize: 100, color: Colors.red),
              );
            } else if (state is LoadingTodoState) {
              return CircularProgressIndicator();
            } else if (state is LoadedTodoState) {
              return Text('${state.list}');
            } else {
              return
              TextButton(onPressed: () {
                _todoBloc.add(LoadTodoApiEvent());
              }, child: Text('Load',style: TextStyle(fontSize: 100),));
            }
          },
        ),
      ),
    );
  }
}
