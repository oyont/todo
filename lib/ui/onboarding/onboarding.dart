import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.2,
            bottom: size.height * 0.1,
            right: size.width * 0.12,
            left: size.width * 0.12),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: SvgPicture.asset("assets/images/onboarding.svg"),
              ),
            ),
            SizedBox(
              height: size.height * 0.14,
            ),
            Text(
              'Reminders made simple',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                color: const Color(0xff554e8f),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 17,
                color: const Color(0xff82a0b7),
                height: 1.411764705882353,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            RoundedButton(),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Container(
      height: 55.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [const Color(0xff5de61a), const Color(0xff39a801)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x8766c81c),
            offset: Offset(0, 5),
            blurRadius: 30,
          ),
        ],
      ),
      child: Text(
        'Get Started',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 15,
          color: const Color(0xfffcfcfc),
          fontWeight: FontWeight.w600,
          height: 0.7333333333333333,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
