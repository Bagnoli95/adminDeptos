import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../config/properties.dart';
import '../../ui/pages/loginpage/otp_validation_page.dart';
import 'enviar_otp_controller.dart';
import 'login_controler.dart';

class RegisterController extends GetxController {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController submitController = TextEditingController();

  LoginController loginControler = Get.put(LoginController());
  EnviarOtpController enviarOtpControler = Get.put(EnviarOtpController());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerUser() async {
    try {
      //Armar el request
      var headers = {'Content-Type': "application/json"};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.registration);
      Map bodyRequest = {
        'usuario': usuarioController.text,
        'celular': celularController.text,
        'cedula': cedulaController.text,
        'password': passwordController.text
      };
      print(url.toString());
      print(jsonEncode(bodyRequest).toString());
      //Enviar petición
      http.Response response =
          await http.post(url, body: jsonEncode(bodyRequest), headers: headers);

      print(response.body.toString());
      //Validar Response
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['codReturn'] == '0') {
          var cedula = cedulaController.text;

          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('cedula', cedula);

          //Hacer el login para recuperar el token
          loginControler.loginUser();

          //enviar la OTP
          enviarOtpControler.enviarOtp();

          usuarioController.clear();
          celularController.clear();
          cedulaController.clear();
          passwordController.clear();

          //Go to next page
          Get.off(OtpValidationPage());
        } else {
          throw jsonDecode(response.body)["descripcion"] ??
              "Unknow error occured";
        }
      } else {
        throw jsonDecode(response.body)['error'] ?? "Unknow error occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return SimpleDialog(
              title: Text('error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}

/*
{
    "codReturn": "0",
    "descripcion": "Se registro correctamente"
}
 */