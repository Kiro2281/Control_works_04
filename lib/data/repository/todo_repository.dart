
import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class TodoRepository {
  final Dio _dio = Dio();

  Future<TodoModel> getTodoApi() async {
    final Response response = await _dio.get(
      'https://dummyjson.com/todos/2',
    );
    return TodoModel.fromJson(response.data);
  }
}
