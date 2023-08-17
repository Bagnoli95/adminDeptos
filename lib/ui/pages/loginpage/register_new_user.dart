import 'package:admin_dptos/ui/pages/loginpage/login_wall_page.dart';
import 'package:admin_dptos/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';

import 'package:admin_dptos/ui/utils/my_button.dart';
import 'package:get/get.dart';
import '../../../controllers/login/register_controler.dart';
import '../../utils/constants.dart';
import '../../utils/my_submit_button.dart';
import '../../utils/my_textfield.dart';
import '../../utils/my_title.dart';
import '../../widgets/my_background.dart';
import 'otp_validation_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // Controller for the text
  RegisterController registerControler = Get.put(RegisterController());
  TextEditingController passwordController = TextEditingController();

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
            //Fondo del login
            Column(
              children: [
                const SizedBox(height: 20),
                my_container(
                  theWidth: 400,
                  theHeight: 500,
                  theChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Contenido del Formulario

                      const MyTitle(titleText: 'Ingrese sus datos'),

                      const SizedBox(height: 20),

                      //UserName
                      MyTextField(
                        controller: registerControler.usuarioController,
                        hintText: 'Usuario',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      //UserName
                      MyTextField(
                        controller: registerControler.cedulaController,
                        hintText: 'Cédula',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      //UserName
                      MyTextField(
                        controller: registerControler.celularController,
                        hintText: 'Telefono',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      MyTextField(
                        controller: registerControler.passwordController,
                        hintText: 'Contraseña',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      //Password
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Verificar Contraseña',
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),

                      // Sign in Button
                      MySubmitButton(
                        buttonLabel: 'Registrarse',
                        onPress: () {
                          if (registerControler.passwordController.text ==
                              passwordController.text) {
                            registerControler.registerUser();
                          } else {
                            showDialog(
                                context: Get.context!,
                                builder: (builder) {
                                  return const SimpleDialog(
                                    title: Text('Atención'),
                                    contentPadding: EdgeInsets.all(20),
                                    children: [
                                      Text('La contraseña no coincide')
                                    ],
                                  );
                                });
                          }
                          ;

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => OtpValidationPage(),
                          //     ));
                        },
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => ResponsiveLayout(
                        //           mobileScaffold: const MobileScaffold(),
                        //           tabletScaffold: const TabletScaffold(),
                        //           desktopScaffold: const DesktopScaffold(),
                        //         ),
                        //       ));
                        // },
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

                      const SizedBox(height: 20),

                      //Registrar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ya está registrado?',
                              style: TextStyle(color: myColorPrimary)),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(
                                LoginPageWallPaper(),
                              );
                            },
                            child: Text(
                              'Iniciar Sesión',
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
          ]),
        ),
      ),
    );
  }
}
