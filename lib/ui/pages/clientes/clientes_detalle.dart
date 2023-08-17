import 'dart:js_util';

import 'package:admin_dptos/controllers/abm/clientes/get_clientes_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../../utils/my_drawer.dart';
import '../../utils/my_loading.dart';

class MyPopUpClienteDetalle extends StatefulWidget {
  MyPopUpClienteDetalle({super.key, required this.idCliente});

  final String idCliente;

  @override
  State<MyPopUpClienteDetalle> createState() => _MyPopUpClienteDetalleState();
}

class _MyPopUpClienteDetalleState extends State<MyPopUpClienteDetalle> {
  final _formKey = GlobalKey<FormState>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<List?>? datosCliente;
  void initState() {
    super.initState();
    final SharedPreferences? prefs = _prefs as SharedPreferences?;
    prefs?.setString('idCliente', widget.idCliente);
    GetClientesDetalleController getClientesDetalleController =
        Get.put(GetClientesDetalleController());
    datosCliente = getClientesDetalleController.getClientesDetalle();
  }

  @override
  Widget build(BuildContext context) {
    print('Tiene que traer los datos del: ');
    return Scaffold(
      backgroundColor: myColorTertiary,
      appBar: myAppBar,
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: datosCliente,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyLoadingAnimation();
          } else {
            return const MyLoadingAnimation();
          }
        },
      ),
    );
  }
}
