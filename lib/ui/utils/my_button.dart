import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonLabel;

  const MyButton({super.key, required this.onTap, required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: myColorPrimary, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(
              color: myColorQuinary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
