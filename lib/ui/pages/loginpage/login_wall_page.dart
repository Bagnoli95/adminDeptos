import 'package:admin_dptos/ui/utils/my_title.dart';
import 'package:admin_dptos/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:admin_dptos/ui/utils/my_textfield.dart';
import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:get/get.dart';

import '../../../controllers/login/login_controler.dart';
import '../../utils/my_submit_button.dart';
import '../../widgets/my_background.dart';
import 'recovery_pass_page.dart';
import 'register_new_user.dart';

class LoginPageWallPaper extends StatefulWidget {
  LoginPageWallPaper({super.key});

  @override
  State<LoginPageWallPaper> createState() => _LoginPageWallPaperState();
}

class _LoginPageWallPaperState extends State<LoginPageWallPaper> {
  LoginController loginControler = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorSecundary,
      body: SafeArea(
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            //Fondo del Login
            const myBackground(),

            //Formulario de login
            Column(
              children: [
                const SizedBox(height: 80),
                my_container(
                  theWidth: 300,
                  theHeight: 400,
                  theChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Contenido del Formulario
                      const SizedBox(height: 70),

                      //Welcome back,
                      const MyTitle(titleText: 'Bienvenido'),
                      const SizedBox(height: 8),

                      //UserName
                      MyTextField(
                        controller: loginControler.cedulaController,
                        hintText: 'Usuario',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      //Password
                      MyTextField(
                        controller: loginControler.passwordController,
                        hintText: 'Contraseña',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Olvide mi contraseña
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecoveryPassPage(),
                                    ));
                              },
                              child: Text(
                                'Olvide mi contraseña',
                                style: TextStyle(color: myColorPrimary),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Sign in Button
                      MySubmitButton(
                        buttonLabel: 'Iniciar sesión',
                        onPress: () => loginControler.loginUser(),
                      ),

                      const SizedBox(height: 10),

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

                      const SizedBox(height: 10),

                      //Registrar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No está registrado?',
                            style: TextStyle(color: myColorPrimary),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(
                                RegisterPage(),
                              );
                            },
                            child: Text(
                              'Registrese',
                              style: TextStyle(
                                  color: myColorPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
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
              top: 35,
              child: SizedBox(
                height: 150,
                child: Image.asset('lib/assets/images/logo.png'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
