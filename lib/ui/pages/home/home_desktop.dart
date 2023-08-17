import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:admin_dptos/ui/utils/my_drawer.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_box.dart';
import '../../widgets/my_tile.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorTertiary,
      appBar: myAppBar,
      body: Row(
        children: [
          MyDrawer(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                //4 box on the top
                AspectRatio(
                  aspectRatio: 4,
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return MyBox();
                        }),
                  ),
                ),

                //tiles below it
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return MyTile();
                  },
                ))
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: myColorQuaternary,
          ))
        ],
      ),
    );
  }
}
