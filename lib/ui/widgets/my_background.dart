import 'package:flutter/material.dart';
import '../utils/constants.dart';

class myBackground extends StatelessWidget {
  const myBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: myColorSecundary,
      // ignore: prefer_const_constructors
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/wall1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
