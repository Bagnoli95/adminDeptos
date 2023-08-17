import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utils/my_drawer.dart';
import '../../widgets/my_box.dart';
import '../../widgets/my_tile.dart';

class ClientesTablet extends StatefulWidget {
  const ClientesTablet({super.key});

  @override
  State<ClientesTablet> createState() => _ClientesTabletState();
}

class _ClientesTabletState extends State<ClientesTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorTertiary,
      appBar: myAppBar,
      drawer: MyDrawer(),
      body: Column(
        children: [
          //4 box on the top
          AspectRatio(
            aspectRatio: 4,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return MyBox();
                  }),
            ),
          ),

          // //tiles below it
          // Expanded(
          //     child: ListView.builder(
          //   itemCount: 1,
          //   itemBuilder: (context, index) {
          //     return MyTile();
          //   },
          // ))

          // Container(
          //   color: myColorSecundary,
          //   child: ListView(children: [
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.all(50.0),
          //         child: LoadingIndicator(
          //             indicatorType: Indicator.ballClipRotateMultiple,

          //             /// Required, The loading type of the widget
          //             colors: [myColorQuaternary, myColorQuinary],

          //             /// Optional, The color collections
          //             strokeWidth: 2,

          //             /// Optional, The stroke of the line, only applicable to widget which contains line
          //             backgroundColor: myColorTertiary,

          //             /// Optional, Background of the widget
          //             pathBackgroundColor: myColorTertiary

          //             /// Optional, the stroke backgroundColor
          //             ),
          //       ),
          //     ),
          //   ]),
          // )
        ],
      ),
    );
  }
}
