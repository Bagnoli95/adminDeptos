import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];

var myColorPrimary = Color.fromRGBO(160, 196, 157, 1);
var myColorSecundary = Color.fromRGBO(196, 215, 178, 1);
var myColorTertiary = Color.fromRGBO(225, 236, 200, 0.5);
var myColorQuaternary = Color.fromRGBO(247, 255, 229, 1);

var myAppBar = AppBar(
  backgroundColor: myColorPrimary,
);

var myDrawer = Drawer(
  backgroundColor: myColorSecundary,
  child: Column(
    children: [
      DrawerHeader(
        child: SizedBox(
          // height: 200,
          child: Image.asset('lib/images/itsFineLogo.png'),
        ),
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text('D A S H B O A R D'),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('E D I F I C I O S'),
      ),
      ListTile(
        leading: Icon(Icons.edit_document),
        title: Text('C O N T R A T O S'),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('C L I E N T E S'),
      ),
      ListTile(
        leading: Icon(Icons.card_membership),
        title: Text('C O M P R A S'),
      ),
      ListTile(
        leading: Icon(Icons.card_giftcard),
        title: Text('P A G O S'),
      ),
    ],
  ),
);
