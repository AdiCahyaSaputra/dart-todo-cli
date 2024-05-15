import 'package:dart_todo_cli/domain/todo_item.dart';

class TodoHelper {
  static int getTodoLastId(List<TodoItem> list) {
    return list.last.id;
  }
}
