import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/utils/clipping_class.dart';
import 'package:todo/ui/todos/tasks_view.dart';

import 'add_task_view.dart';
import 'home_view.dart';
import 'widgets/svg_button.dart';

class TodosView extends StatefulWidget {
  static const String id = "todos_view";

  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  int index = 0;
  List<Widget> _widgets = [HomeView(), TasksView()];
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FCFF),
      body: _widgets[index],
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: _buildFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    final Size size = MediaQuery.of(context).size;
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  AddTaskScreen(),
                ],
              ),
            ),
          ),
        );
      },
      child: SvgButton(icon: SvgPicture.asset("assets/images/new-button.svg")),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: index,
      onTap: tapped,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home-icon.svg"),
            activeIcon: SvgPicture.asset("assets/images/home-icon-active.svg"),
            title: Text(
              'Home',
              style: TextStyle(
                  color: index == 0 ? Color(0xFF5F87E7) : Color(0xFFBEBEBE)),
            )),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/grid-icon.svg"),
            activeIcon: SvgPicture.asset("assets/images/grid-icon-active.svg"),
            title: Text(
              'Task',
              style: TextStyle(
                  color: index == 1 ? Color(0xFF5F87E7) : Color(0xFFBEBEBE)),
            )),
      ],
    );
  }
}
