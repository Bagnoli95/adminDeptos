import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../config/properties.dart';

class GetClientesDetalleController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List>? getClientesDetalle() async {
    final String? idCliente;
    List list = [];
    try {
      final SharedPreferences? prefs = await _prefs;
      var token = await prefs?.get('token');
      final String headerToken = 'Bearer ' + token.toString();
      var idCliente = await prefs?.get('idCliente');
      //Armar el request
      var headers = {
        'Authorization': headerToken,
        'Content-Type': "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      };
      print(headers.toString());

      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.clientesABM.DetalleCliente);
      print(url.toString());

      // Map bodyRequest = {"idCliente": "6"};
      Map bodyRequest = {
        'idCliente': idCliente.toString(),
      };
      print(jsonEncode(bodyRequest).toString());

      //Enviar petición
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(bodyRequest));

      // print('RESPONSE get_clientes: ' + response.body.toString());

      //Validar Response
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final SharedPreferences? prefs = await _prefs;
        if (json['codReturn'] == "0") {
          // si todo esta bien, terminar el programa y que no pase nada
          var id = json['data']['id'] ?? '';
          var nombre = json['data']['nombre'] ?? 'vacio';
          var apellido = json['data']['apellido'] ?? 'vacio';
          var documento = json['data']['documento'] ?? 'vacio';
          var telefonoPrincipal = json['data']['telefonoPrincipal'] ?? 'vacio';
          var telefonoSecundario =
              json['data']['telefonoSecundario'] ?? 'vacio';
          var direccion = json['data']['direccion'] ?? 'vacio';
          var correo = json['data']['correo'] ?? 'vacio';

          list.add(json['data']);
          // list.add(id);
          // list.add(nombre);
          // list.add(apellido);
          // list.add(documento);
          // list.add(telefonoPrincipal);
          // list.add(telefonoSecundario);
          // list.add(direccion);
          // list.add(correo);

          // print('');
          print('Datos del Cliente:');
          print('id:' + id);
          print('nombre:' + nombre);
          print('apellido:' + apellido);
          print('documento:' + documento);
          print('telefonoPrincipal:' + telefonoPrincipal);
          print('telefonoSecundario:' + telefonoSecundario);
          print('direccion:' + direccion);
          print('correo:' + correo);

          return list;
          // si ya no está validado, entonces borrar el prefer y devolver a la pantalla de inicio
        } else {
          // prefs?.clear();
          // Get.offAll(LoginPageWallPaper());
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
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
    return list;
  }
}
