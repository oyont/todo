import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/services/todo_service.dart';
import 'package:todo/core/utils/clipping_class.dart';
import 'package:todo/ui/todos/widgets/svg_button.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          width: size.width,
          height: 53,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    color: Colors.red,
                    height: 30,
                    width: size.width,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: (size.width / 2) - 25,
                child: SvgButton(
                  icon: SvgPicture.asset("assets/images/cancel-button.svg"),
                ),
              )
            ],
          ),
        ),
        Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  // add our task to the list
                  Provider.of<TodoService>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
