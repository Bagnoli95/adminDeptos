import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class my_container extends StatelessWidget {
  const my_container(
      {super.key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild});

  final double theWidth;
  final double theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    // return containerSimple(
    //   width: theWidth,
    //   height: theHeight,
    //   child: theChild,
    // );
    return containerFrostedGlass(
      width: theWidth,
      height: theHeight,
      child: theChild,
    );
  }
}

class containerSimple extends StatelessWidget {
  const containerSimple({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final width;
  final height;
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: myColorTertiary,
          // color: Colors.green,
          boxShadow: [myShadow]),
      child: child,
    );
  }
}

class containerFrostedGlass extends StatelessWidget {
  containerFrostedGlass({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final _borderRadius = BorderRadius.circular(20);

  final double width;
  final double height;
  final child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Container(
        alignment: Alignment(0, 0),
        margin: EdgeInsets.symmetric(vertical: 20),
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            //Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(),
            ),

            //gradient effect
            Container(
              decoration: BoxDecoration(
                  borderRadius: _borderRadius,
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.1),
                    ],
                  )),
            ),

            //child
            Center(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
