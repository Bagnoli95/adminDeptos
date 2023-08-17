import 'package:admin_dptos/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/abm/clientes/get_clientes.dart';
import 'pop_detalle_clientes.dart';
import '../../utils/my_drawer.dart';
import '../../utils/my_loading.dart';
import 'clientes_detalle.dart';

class ClientesDesktop extends StatefulWidget {
  const ClientesDesktop({super.key});

  @override
  State<ClientesDesktop> createState() => _ClientesDesktopState();
}

class _ClientesDesktopState extends State<ClientesDesktop> {
  Future<List?>? _listaCLientes;
  void initState() {
    super.initState();
    GetClientesController getClientesController =
        Get.put(GetClientesController());
    _listaCLientes = getClientesController.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorTertiary,
      appBar: myAppBar,
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: _listaCLientes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? lista = [];
            lista = snapshot.data;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Container(
                  color: myColorQuinary,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('FILTROS'),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Agregar Cliente'),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: myColorQuinary),
                  child: DataTable(
                    dataRowMinHeight: 1,
                    showBottomBorder: true,
                    headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => myColorSecundary),
                    columns: const [
                      DataColumn(
                          label: Text('id'),
                          tooltip: 'Identificador del Cliente'),
                      DataColumn(
                          label: Text('Nombres'),
                          tooltip: 'Nombre de los Clientes'),
                      DataColumn(
                          label: Text('Apellidos'),
                          tooltip: 'Apellidos de los Clientes'),
                      DataColumn(
                          label: Text('Documentos'),
                          tooltip: 'Documentos de los Clientes'),
                      DataColumn(
                          label: Text('Teléfonos'),
                          tooltip: 'Teléfono Principal de los Clientes'),
                      DataColumn(
                          label: Text('Editar'),
                          tooltip: 'permite editar los datos'),
                    ],
                    rows: List<DataRow>.generate(
                      lista!.length,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(snapshot.data![index]['id'].toString()),
                          ),
                          DataCell(
                            Text(snapshot.data![index]['nombre'].toString()),
                          ),
                          DataCell(
                            Text(snapshot.data![index]['apellido'].toString()),
                          ),
                          DataCell(
                            Text(snapshot.data![index]['documento'].toString()),
                          ),
                          DataCell(
                            Text(snapshot.data![index]['telefono'].toString()),
                          ),
                          DataCell(
                            TextButton.icon(
                              icon: Icon(Icons.edit),
                              label: Text(''),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return PopUpDetalle(
                                        idCliente: snapshot.data![index]['id']
                                            .toString(),
                                      );
                                      // MyPopUpClienteDetalle(
                                      //     idCliente: snapshot.data![index]['id']
                                      //         .toString());
                                    });

                                print('Se va a editar el row: ' +
                                    snapshot.data![index]['id'].toString());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return MyLoadingAnimation();
          }
        },
      ),
    );
  }
}
