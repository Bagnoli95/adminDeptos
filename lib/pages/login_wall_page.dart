import 'package:flutter/material.dart';
import 'package:admin_dptos/components/my_button.dart';
import 'package:admin_dptos/components/my_textfield.dart';
import 'package:admin_dptos/util/square_tile.dart';
import 'package:admin_dptos/constants.dart';

import '../responsive/desktop_scaffold.dart';
import '../responsive/mobile_scaffold.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/tablet_scaffold.dart';

class LoginPageWallPaper extends StatelessWidget {
  LoginPageWallPaper({super.key});

  // Controller for the text
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorSecundary,
      body: SafeArea(
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            //Fondo del Login
            Container(
              color: myColorSecundary,
            ),

            //Formulario de login
            //Fondo del login
            Column(
              children: [
                const SizedBox(height: 80),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  height: 500,
                  // height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: myColorTertiary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Contenido del Formulario
                      const SizedBox(height: 90),

                      //Welcome back,
                      Text(
                        'Bienvenido a la app',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 20),

                      //UserName
                      MyTextField(
                        controller: userNameController,
                        hintText: 'Usuario',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      //Password
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Contraseña',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Olvido su contraseña?',
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Sign in Button
                      MyButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResponsiveLayout(
                                  mobileScaffold: const MobileScaffold(),
                                  tabletScaffold: const TabletScaffold(),
                                  desktopScaffold: const DesktopScaffold(),
                                ),
                              ));
                        },
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Text(
                                'O continue con',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      //Iconos de inicio de sesion
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icono Google
                          SquareTile(imagePath: 'lib/images/Google.png'),
                          SizedBox(width: 10),
                          //Icono Facebook
                          SquareTile(imagePath: 'lib/images/apple.png'),
                        ],
                      ),

                      const SizedBox(height: 10),

                      //Registrar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No está registrado?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Registrese',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Logo
            Positioned(
              top: 10,
              child: SizedBox(
                height: 200,
                child: Image.asset('lib/images/itsFineLogo.png'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
