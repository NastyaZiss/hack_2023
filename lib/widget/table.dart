import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class TableC extends StatelessWidget {
  const TableC({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        child: ExpansionTile(
          backgroundColor: TSC.base,
          title: Text(
            text,
            style: TSC.boldh2
                .copyWith(color: const Color(0xffA34B0D)),
          ),
          children: [
            _createDataTable(),
          ],
        ),
      ),
    );
  }
  Padding _createDataTable() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: DataTable(
                headingRowHeight: 40,
                dataRowHeight: 40,
                headingTextStyle: TSC.boldh2,
                dataTextStyle: TSC.boldh3,
                decoration: const BoxDecoration(
                  color: TSC.baseLigt,
                ),
                dataRowColor:
                MaterialStateColor.resolveWith((states) => TSC.baseLigt2),
                border: TableBorder.all(
                  width: 1,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white38,
                ),
                columns: _createColumns(),
                rows: _createRows()),
          ),
        ],
      ),
    );
  }
  List<DataColumn> _createColumns() {
    return [
      const DataColumn(label: Text('Дни')),
      const DataColumn(label: Text('1')),
      const DataColumn(label: Text('2')),

      const DataColumn(label: Text('3')),
      const DataColumn(label: Text('4')),
      const DataColumn(label: Text('5')),
      const DataColumn(label: Text('6')),

      const DataColumn(label: Text('7')),
    ];
  }

  List<DataRow> _createRows() {
    return [
      const DataRow(cells: [
        DataCell(Text('Расстояние')),
        DataCell(Text('25')),
        DataCell(Text('41')),

        DataCell(Text('98')),
        DataCell(Text('0')),
        DataCell(Text('12')),
        DataCell(Text('23')),

        DataCell(Text('2')),
      ]),

    ];
  }
}
