import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/abm/clientes/get_clientes_detail.dart';
import '../../utils/my_loading.dart';

class PopUpDetalle extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PopUpDetalle({super.key, required this.idCliente});

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final idCliente;
  Future<List>? datosCliente;

  GetClientesDetalleController clienteDetalleControler =
      Get.put(GetClientesDetalleController());

  void initState() {
    final SharedPreferences prefs = _prefs as SharedPreferences;
    prefs.setString('idCliente', idCliente);
    print('setString: ' + idCliente.toString());

    GetClientesDetalleController getClientesController =
        Get.put(GetClientesDetalleController());
    datosCliente = getClientesController.getClientesDetalle();
  }

  @override
  Widget build(BuildContext context) {
    datosCliente = (clienteDetalleControler.getClientesDetalle());

    print('SI ME EJECUTE PARA EL ID: ' + idCliente);
    print('DATOS DEL CLIENTE: ' + datosCliente.toString());

    return FutureBuilder(
      future: datosCliente,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var lista = snapshot.data;
          print('lista.toString(): ' + lista.toString());
          return AlertDialog(
            content: Stack(
              // overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(lista![0]['nombre'].toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(lista[0]['apellido'].toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                            initialValue: lista[0]['apellido'].toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text(idCliente),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return MyLoadingAnimation();
        }
      },
    );
  }
}
