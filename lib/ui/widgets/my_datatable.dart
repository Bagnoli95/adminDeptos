import 'package:flutter/material.dart';

import '../utils/constants.dart';

class my_datatable extends StatelessWidget {
  const my_datatable(
      {super.key, required this.createColumns, required this.createRows});

  final createColumns;
  final createRows;

  Widget build(BuildContext context) {
    return DataTable(
      columns: createColumns(),
      rows: createRows(),
      dividerThickness: 5,
      dataRowMinHeight: 10,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => myColorSecundary),
    );
  }
}
