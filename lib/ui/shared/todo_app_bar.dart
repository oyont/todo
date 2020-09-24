import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoAppBar extends StatelessWidget {
  Positioned buildBgCircle(
      {double top, double left, double right, double size, double radius}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(radius, radius)),
          color: const Color(0x2bffffff),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0XFF3867D5), Color(0XFF81C7F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          buildBgCircle(top: -105.0, left: -90.0, size: 211.0, radius: 105.5),
          buildBgCircle(top: -10.0, right: -20.0, size: 93.0, radius: 46.5),
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 54.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 23,
                              color: const Color(0xffffffff),
                            ),
                            children: [
                              TextSpan(
                                text: 'Hello Brenda!\n',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              TextSpan(
                                text: 'Today you have no tasks',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: const Color(0xfff1f1f1),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Image.asset(
                      "assets/images/avatar.png",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(18.0, 119.0),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 49.0, sigmaY: 49.0),
              child: Container(
                width: 339.0,
                height: 106.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0x4fffffff),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset("assets/images/bell.svg"),
        ),
        Text(
          'Today Reminder',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          'Meeting with client',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 11,
            color: const Color(0xfff3f3f3),
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          '13.00 PM',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 11,
            color: const Color(0xfff3f3f3),
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
