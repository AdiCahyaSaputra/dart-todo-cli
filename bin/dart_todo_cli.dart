import 'dart:io';

import 'package:dart_todo_cli/core/todo.dart';
import 'package:dart_todo_cli/domain/todo_item.dart';

runTheProgram() async {
  Todo todo = Todo();

  while (true) {
    stdout.write('''Welcome to dart-todo-cli :)
    
  1. Get All Todo
  2. Add Todo
  3. Update Todo
  4. Delete Todo

Type `exit` to close the program
    
[enter command] : ''');

    String? input = stdin.readLineSync();

    if (input is String) {
      switch (input) {
        case '1':
          stdout.write(todo.allTodo);
          break;
        case '2':
          stdout.write('''todo -> ''');

          String? todoInput = stdin.readLineSync();

          if (todoInput is String) {
            stdout.write('create todo...');

            await Future.delayed(Duration(seconds: 1), () {
              todo.addTodo(TodoItem(todoInput));
            });

            stdout.write('todo created');

            todo.allTodo.map((e) => print('Todo : $e'));
          }

          break;
      }

      if (input.toLowerCase() == 'exit') {
        break;
      }
    }
  }
}

void main(List<String> arguments) {
  runTheProgram();
}
