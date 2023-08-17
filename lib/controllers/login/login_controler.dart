import 'dart:convert';
import 'dart:ui';

import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../config/properties.dart';
import '../../ui/pages/control_responsive_layout.dart';
import '../../ui/pages/home/home_desktop.dart';
import '../../ui/pages/home/home_mobile.dart';
import '../../ui/pages/home/home_tablet.dart';
import '../../ui/widgets/message.dart';

class LoginController extends GetxController {
  TextEditingController cedulaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser() async {
    try {
      //Armar el request
      var headers = {
        'Content-Type': "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      };
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.login);
      Map bodyRequest = {
        'cedula': cedulaController.text,
        'password': passwordController.text
      };

      print('Url: ' +
          url.toString() +
          '. Request: ' +
          jsonEncode(bodyRequest).toString());

      //Enviar petición
      http.Response response =
          await http.post(url, body: jsonEncode(bodyRequest), headers: headers);

      print('RESPONSE: ' + response.body.toString());

      //Validar Response
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['codReturn'] == "0") {
          var token = json['token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token);
          cedulaController.clear();
          passwordController.clear();

          Get.off(
            const ControlResponsive(
              mobileScaffold: HomeMobile(),
              tabletScaffold: HomeTablet(),
              desktopScaffold: HomeDesktop(),
            ),
          );
        } else {
          throw jsonDecode(response.body)["error"] ?? "Unknow error occured";
        }
      } else {
        throw jsonDecode(response.body)['error'] ?? "Unknow error occured";
      }
    } catch (e) {
      print(e.toString());
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (builder) {
            return CustomToast(
              tittle: 'ERROR',
              message: 'soy una descripcion',
            );
          });
    }
  }
}
