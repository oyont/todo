import 'package:todo/core/consts/constants.dart';
import 'package:todo/core/models/project.dart';
import 'package:todo/core/models/todo_item.dart';
import 'package:flutter/foundation.dart';

class TodoService extends ChangeNotifier {
  List<TodoItem> _list = [
    TodoItem(
      date: '07.00 AM',
      done: true,
      remind: false,
      title: 'Go jogging',
      project: Project(color: kYellow, title: 'Personal', icon: ''),
    ),
    TodoItem(
      date: '08.00 AM',
      done: false,
      remind: false,
      title: 'Send project file',
      project: Project(color: kGreen, title: 'Work', icon: ''),
    ),
    TodoItem(
      date: '09.00 AM',
      done: false,
      remind: false,
      title: 'Meeting with client',
      project: Project(color: kPink, title: 'Meeting', icon: ''),
    ),
    TodoItem(
      date: '10.00 AM',
      done: false,
      remind: false,
      title: 'Email client',
      project: Project(color: kGreen, title: 'Work', icon: ''),
    ),
    TodoItem(
      date: '07.00 AM',
      done: false,
      remind: false,
      title: 'Morning Yoga',
      project: Project(color: kYellow, title: 'Personal', icon: ''),
    ),
  ];

  int todosCount() {
    return _list.length;
  }

  List<TodoItem> fetchTodos() {
    return _list;
  }

  void toggleDone(TodoItem todoItem) {
    todoItem.toggleDone();
    notifyListeners();
  }

  void toggleRemind(TodoItem todoItem) {
    todoItem.toggleRemind();
    notifyListeners();
  }

  void addTask(String name) {
    final task = TodoItem(
      date: '07.00 AM',
      done: false,
      remind: false,
      title: name,
      project: Project(color: kYellow, title: 'Personal', icon: ''),
    );
    _list.add(task);
    notifyListeners();
  }
}
