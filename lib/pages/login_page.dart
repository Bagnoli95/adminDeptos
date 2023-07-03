import 'package:admin_dptos/components/my_button.dart';
import 'package:admin_dptos/components/my_textfield.dart';
import 'package:admin_dptos/util/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:admin_dptos/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Controller for the text
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // sing user method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //Logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 25),

              //Welcome back,
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //UserName
              MyTextField(
                controller: userNameController,
                hintText: 'UserName',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //Password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Sign in Button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

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
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Or continue with',
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

              const SizedBox(height: 20),

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

              const SizedBox(height: 50),

              //Registrar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Register Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
