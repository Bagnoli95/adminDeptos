import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:admin_dptos/ui/widgets/my_box.dart';
import 'package:admin_dptos/ui/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utils/my_drawer.dart';

class ClientesMobile extends StatefulWidget {
  const ClientesMobile({super.key});

  @override
  State<ClientesMobile> createState() => _ClientesMobileState();
}

class _ClientesMobileState extends State<ClientesMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myColorTertiary,
      drawer: MyDrawer(),
      body: Column(
        children: [
          LoadingIndicator(
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
        ],
      ),
    );
  }
}
