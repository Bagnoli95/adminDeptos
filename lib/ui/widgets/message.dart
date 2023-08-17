import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomToast extends StatefulWidget {
  String? message;
  String? tittle;

  CustomToast({required this.message, required this.tittle});

  @override
  State<StatefulWidget> createState() {
    return _CustomToastState();
  }

  void show(BuildContext context, String message) {
    showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return CustomToast(
            message: message,
            tittle: tittle,
          );
        },
        transitionBuilder: (ctx, a1, a2, child) {
          return SlideTransition(
              position:
                  Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(a1),
              child: child);
        },
        transitionDuration: Duration(milliseconds: 700));
  }
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(top: kToolbarHeight),
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.red.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0)),
        child: Text(
          //   children: [
          //     Text(
          widget.message ?? "",
          style: TextStyle(color: myColorQuinary, fontSize: 10),
        ),
        //     Text(
        //       widget.message ?? "",
        //       style: TextStyle(color: myColorQuinary, fontSize: 16),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
