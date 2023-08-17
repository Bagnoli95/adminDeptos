class ListaClientes {
  String? id;
  String? nombres;
  String? apellidos;
  String? ci_ruc;

  ListaClientes({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.ci_ruc,
  });

  factory ListaClientes.fromJson(Map<String, dynamic> json) {
    return ListaClientes(
        id: json["id"] ?? '',
        nombres: json["nombres"] ?? '',
        apellidos: json["apellidos"] ?? '',
        ci_ruc: json["ci_ruc"] ?? '');
  }
}
