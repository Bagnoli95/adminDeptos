import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'constants.dart';

class MyLoadingAnimation extends StatelessWidget {
  const MyLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColorSecundary,
      child: ListView(children: [
        Center(
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                height: 300,
                width: 300,
                child: LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,

                    /// Required, The loading type of the widget
                    colors: [myColorQuaternary, myColorQuinary],

                    /// Optional, The color collections
                    strokeWidth: 2,

                    /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: myColorTertiary,

                    /// Optional, Background of the widget
                    pathBackgroundColor: myColorTertiary

                    /// Optional, the stroke backgroundColor
                    ),
              )),
        ),
      ]),
    );
  }
}
