import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/images/empty-task.svg"),
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            'No tasks',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 22,
              color: const Color(0xff554e8f),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'You have no task to do.',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 17,
              color: const Color(0xff82a0b7),
              height: 1.411764705882353,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
