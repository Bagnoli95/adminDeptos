import 'package:admin_dptos/ui/utils/my_title.dart';
import 'package:admin_dptos/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:admin_dptos/ui/utils/my_button.dart';
import 'package:admin_dptos/ui/utils/my_textfield.dart';
import 'package:admin_dptos/ui/utils/constants.dart';

import '../../widgets/my_background.dart';
import 'login_wall_page.dart';
import 'otp_validation_page.dart';

class RecoveryPassPage extends StatelessWidget {
  RecoveryPassPage({super.key});

  // Controller for the text
  final cellphoneController = TextEditingController();

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
                const SizedBox(height: 80),
                my_container(
                  theWidth: 300,
                  theHeight: 300,
                  theChild: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Contenido del Formulario
                      const SizedBox(height: 40),

                      const MyTitle(titleText: 'Recuperar contraseña'),

                      const SizedBox(height: 40),

                      //UserName
                      MyTextField(
                        controller: cellphoneController,
                        hintText: 'Teléfono',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Ingrese su nro de teléfono',
                        style: TextStyle(color: myColorPrimary),
                      ),

                      const SizedBox(height: 10),

                      // Sign in Button
                      MyButton(
                          buttonLabel: 'Enviar OTP',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpValidationPage(),
                                ));
                          }),

                      //Registrar
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
