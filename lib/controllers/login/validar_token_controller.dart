import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../config/properties.dart';
import '../../ui/pages/loginpage/login_wall_page.dart';

class ValidarTokenController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> validarToken() async {
    try {
      final SharedPreferences? prefs = await _prefs;
      var token = await prefs?.get('token');
      final String headerToken = 'Bearer ' + token.toString();
      //Armar el request
      var headers = {
        'Authorization': headerToken,
        'Content-Type': "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      };
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.validarToken);

      //Enviar petición
      http.Response response = await http.get(url, headers: headers);

      print('RESPONSE validar_token: ' + response.body.toString());

      //Validar Response
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['codReturn'] == "0") {
          // si todo esta bien, terminar el programa y que no pase nada
          return;
          // si ya no está validado, entonces borrar el prefer y devolver a la pantalla de inicio
        } else {
          prefs?.clear();
          Get.offAll(LoginPageWallPaper());
        }
      } else {
        prefs?.clear();
        Get.offAll(LoginPageWallPaper());
        throw jsonDecode(response.body)['error'] ?? "Unknow error occured";
      }
    } catch (e) {
      print(e.toString());
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
