import 'package:flutter/material.dart';

import 'constants.dart';

class MyTitle extends StatelessWidget {
  final String titleText;

  const MyTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 23,
        color: myColorQuinary,
        fontWeight: FontWeight.bold,
        // fontStyle: FontStyle.normal,
        letterSpacing: 3,
        wordSpacing: 1,
        shadows: [myShadow],
      ),
    );
  }
}
