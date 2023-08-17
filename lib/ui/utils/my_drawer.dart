import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/login/validar_token_controller.dart';
import '../pages/clientes/clientes_desktop.dart';
import '../pages/clientes/clientes_mobile.dart';
import '../pages/clientes/clientes_tablet.dart';
import '../pages/control_responsive_layout.dart';
import '../pages/home/home_desktop.dart';
import '../pages/home/home_mobile.dart';
import '../pages/home/home_tablet.dart';
import '../pages/loginpage/login_wall_page.dart';
import 'constants.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  ValidarTokenController validarTokenControler =
      Get.put(ValidarTokenController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: myColorQuaternary,
      child: Column(
        children: [
          DrawerHeader(
            child: SizedBox(
              // height: 200,
              child: Image.asset('lib/assets/images/logo.png'),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.dashboard, color: myColorPrimary),
                title: Text('H O M E', style: TextStyle(color: myColorPrimary)),
                onTap: () async {
                  //Comprobar si el token sigue siendo valido
                  //Comprobar si el token sigue siendo valido
                  validarTokenControler.validarToken();
                  Get.offAll(
                    const ControlResponsive(
                      mobileScaffold: HomeMobile(),
                      tabletScaffold: HomeTablet(),
                      desktopScaffold: HomeDesktop(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: myColorPrimary,
                ),
                title: Text('C L I E N T E S',
                    style: TextStyle(color: myColorPrimary)),
                onTap: () async {
                  //Comprobar si el token sigue siendo valido
                  validarTokenControler.validarToken();
                  Get.offAll(
                    const ControlResponsive(
                      mobileScaffold: ClientesMobile(),
                      tabletScaffold: ClientesTablet(),
                      desktopScaffold: ClientesDesktop(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.edit_document,
                  color: myColorPrimary,
                ),
                title: Text('C O N T R A T O S',
                    style: TextStyle(color: myColorPrimary)),
                onTap: () {
                  print('tile 3');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: myColorPrimary,
                ),
                title: Text('C L I E N T E S',
                    style: TextStyle(color: myColorPrimary)),
                onTap: () {
                  print('Tile 4');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.card_membership,
                  color: myColorPrimary,
                ),
                title: Text('C O M P R A S',
                    style: TextStyle(color: myColorPrimary)),
                onTap: () {
                  print('Tile 5');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  color: myColorPrimary,
                ),
                title:
                    Text('T O K E N', style: TextStyle(color: myColorPrimary)),
                onTap: () async {
                  final SharedPreferences? prefs = await _prefs;
                  print(prefs?.get('token'));
                },
              ),
            ],
          )),

          //Grupo del Footer
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: myColorQuinary,
                      ),
                    ),
                  ],
                ),
              ),

              //LogOutButton
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: myColorPrimary,
                ),
                title: Text(
                  'C E R R A R  S E S I O N',
                  style: TextStyle(color: myColorPrimary),
                ),
                onTap: () async {
                  final SharedPreferences? prefs = await _prefs;
                  prefs?.clear();
                  Get.offAll(LoginPageWallPaper());
                  // context.go('/');
                  // print('LogOut');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
