import 'package:todo/core/models/project.dart';

class TodoItem {
  final String date;
  final Project project;
  final String title;
  bool remind;
  bool done;

  TodoItem({this.date, this.project, this.title, this.remind, this.done});

  void toggleDone() {
    done = !done;
  }

  void toggleRemind() {
    remind = !remind;
  }
}
