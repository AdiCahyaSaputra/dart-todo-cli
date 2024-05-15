import 'package:intl/intl.dart';

class TodoItem {
  String todo;
  String date;
  int? id;

  TodoItem(this.todo)
      : date = DateFormat('Y-m-d H:m:s').format(DateTime.now());
}
