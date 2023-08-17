import 'package:admin_dptos/ui/utils/my_title.dart';
import 'package:admin_dptos/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:admin_dptos/ui/utils/my_textfield.dart';
import 'package:admin_dptos/ui/utils/constants.dart';

import '../../utils/my_link_text.dart';
import '../../utils/my_submit_button.dart';
import '../../widgets/my_background.dart';

class OtpValidationPage extends StatelessWidget {
  OtpValidationPage({super.key});

  // Controller for the text
  final otpController = TextEditingController();

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

                      const MyTitle(titleText: 'Validar OTP'),

                      const SizedBox(height: 40),

                      //UserName
                      MyTextField(
                        controller: otpController,
                        hintText: 'Código',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Ingrese el código',
                        style: TextStyle(color: myColorPrimary),
                      ),

                      const SizedBox(height: 10),

                      // Sign in Button
                      MySubmitButton(
                        buttonLabel: 'Validar Código',
                        onPress: () {
                          print('Validando OTP');
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
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      const MyLinkeableText(textLabel: 'Reenviar OTP'),
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
