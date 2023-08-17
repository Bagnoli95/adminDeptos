import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: myColorQuaternary,
        height: 80,
      ),
    );
  }
}
