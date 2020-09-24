import 'package:todo/core/consts/constants.dart';
import 'package:todo/core/models/project.dart';

class ProjectService {
  List<Project> _list = [
    Project(color: kYellow, title: 'Personal', icon: ''),
    Project(color: kGreen, title: 'Work', icon: ''),
    Project(color: kPink, title: 'Meeting', icon: ''),
    Project(color: kOrange, title: 'Shopping', icon: ''),
  ];

  int todosCount() {
    return _list.length;
  }

  List<Project> fetchTodos() {
    return _list;
  }
}
