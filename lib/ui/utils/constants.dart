import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];

// var myColorPrimary = Color.fromRGBO(160, 196, 157, 1);
// var myColorSecundary = Color.fromRGBO(196, 215, 178, 1);
// var myColorTertiary = Color.fromRGBO(225, 236, 200, 0.5);
// var myColorQuaternary = Color.fromRGBO(247, 255, 229, 1);

var myColorPrimary = Color.fromRGBO(43, 55, 72, 1);
var myColorSecundary = Color.fromRGBO(43, 55, 72, 1);
var myColorTertiary = Color.fromRGBO(101, 124, 133, 1);
var myColorQuaternary = Color.fromRGBO(146, 173, 167, 1);

var myColorQuinary = Color.fromRGBO(255, 255, 255, 1);

var myShadow = BoxShadow(
    color: Colors.black.withOpacity(0.6),
    spreadRadius: 1,
    blurRadius: 1,
    offset: Offset(1, 1));

var myAppBar = AppBar(
  backgroundColor: myColorQuaternary,
);

// var myDrawer = Drawer(
//   backgroundColor: myColorQuaternary,
//   child: Column(
//     children: [
//       DrawerHeader(
//         child: SizedBox(
//           // height: 200,
//           child: Image.asset('lib/assets/images/logo2.png'),
//         ),
//       ),
//       Expanded(
//           child: Column(
//         children: [
//           ListTile(
//             leading: Icon(Icons.dashboard, color: myColorPrimary),
//             title: Text('D A S H B O A R D',
//                 style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('First tile');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.home,
//               color: myColorPrimary,
//             ),
//             title: Text('E D I F I C I O S',
//                 style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('Second tile');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.edit_document,
//               color: myColorPrimary,
//             ),
//             title: Text('C O N T R A T O S',
//                 style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('tile 3');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.person,
//               color: myColorPrimary,
//             ),
//             title: Text('C L I E N T E S',
//                 style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('Tile 4');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.card_membership,
//               color: myColorPrimary,
//             ),
//             title:
//                 Text('C O M P R A S', style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('Tile 5');
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.card_giftcard,
//               color: myColorPrimary,
//             ),
//             title: Text('P A G O S', style: TextStyle(color: myColorPrimary)),
//             onTap: () {
//               print('Tile 6');
//             },
//           ),
//         ],
//       )),

//       //Grupo del Footer
//       Column(
//         // mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           //Divider
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Divider(
//                     thickness: 0.5,
//                     color: myColorQuinary,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           //LogOutButton
//           ListTile(
//             leading: Icon(
//               Icons.logout,
//               color: myColorPrimary,
//             ),
//             title: Text(
//               'C E R R A R  S E S I O N',
//               style: TextStyle(color: myColorPrimary),
//             ),
//             onTap: () {
//               print('LogOut');
//             },
//           ),
//         ],
//       ),
//     ],
//   ),
// );
