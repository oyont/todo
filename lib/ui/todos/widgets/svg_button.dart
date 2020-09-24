import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final SvgPicture icon;

  const SvgButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(26.5, 26.5)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x78f456c3),
                offset: Offset(0, 7),
                blurRadius: 9,
              )
            ]),
        child: icon);
  }
}
