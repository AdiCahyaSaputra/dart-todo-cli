import 'package:dart_todo_cli/domain/todo_item.dart';
import 'package:intl/intl.dart';

class Todo {
  List<TodoItem> _allTodo = [];

  List<TodoItem> get allTodo => _allTodo;

  set allTodo(List<TodoItem> allTodo) {
    if (allTodo.isEmpty) {
      print('Todo is required');

      return;
    }

    _allTodo = allTodo;
  }

  List<TodoItem> getAllTodo() {
    return _allTodo;
  }

  void addTodo(TodoItem todoItem) {
    String trimmedTodo = todoItem.todo.trim();

    if (trimmedTodo.isEmpty) {
      print('Todo is required');

      return;
    }

    if(_allTodo.isNotEmpty && _allTodo.last.id is int) {
      todoItem.id = _allTodo.last.id! + 1;
    } else {
      todoItem.id = 1;
    }

    todoItem.todo = trimmedTodo;
    todoItem.date = DateFormat('Y-m-d H:m:s').format(DateTime.now());

    _allTodo.add(todoItem);
  }

  void editTodo(int id, TodoItem todoItem) {
    if (id < 1) {
      print('Todo not found');

      return;
    }

    try {
      TodoItem foundTodoItem =
          _allTodo.firstWhere((element) => element.id == id);

      foundTodoItem.todo = todoItem.todo;
      foundTodoItem.date = DateFormat('Y-m-d H:m:s').format(DateTime.now());
      
    } on Exception catch (error) {
      print('Error updating todo : $error');
    }
  }

  void deleteTodo(int id) {
    if (id < 1) {
      print('Todo not found');

      return;
    }

    try {
      _allTodo.removeWhere((element) => element.id == id);
    } on Exception catch(error) {
      print('Error deleting todo : $error');
    }
  }
}
