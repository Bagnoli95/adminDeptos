import 'package:flutter/material.dart';

class MyLinkeableText extends StatelessWidget {
  final String textLabel;
  const MyLinkeableText({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('REENVIAR OTP');
      },
      child: Text(
        textLabel,
        style:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
      ),
    );
  }
}
