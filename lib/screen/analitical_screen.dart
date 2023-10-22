import 'package:flutter/material.dart';

import '../style.dart';
import '../widget/button_app_disible.dart';
import '../widget/drop_list.dart';

class Analitical extends StatefulWidget {
  const Analitical({super.key});

  @override
  State<Analitical> createState() => _AnaliticalState();
}

class _AnaliticalState extends State<Analitical> {
  String dropdownValue = '1 скад';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TSC.boldTitlePhone.copyWith(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropList(
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              list: [],
            ),

            // Text(
            //   'Карта отображений',
            // ),
            // SizedBox(
            //   width: 30,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ButtonAppBarDisible(
                small: true,
                text: 'Смотреть карту',
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            )
          ],
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: TSC.base.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Статистика Погрузчик',
                    style: TSC.boldTitle,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(17.0),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              child: ExpansionTile(
                                backgroundColor: TSC.base,
                                title: Text(
                                  'Пройденное расстояние',
                                  style: TSC.boldh2
                                      .copyWith(color: Color(0xffA34B0D)),
                                ),
                                children: [
                                  _createDataTable(),
                                ],
                              ),
                            ),
                          ),
                          // child: DataTable(
                          //   columns: [],
                          //   rows: [],
                          // ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: DataTable(
                headingRowHeight: 40,
                dataRowHeight: 40,
                headingTextStyle: TSC.boldh2,
                dataTextStyle: TSC.boldh3,
                decoration: BoxDecoration(
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
      DataColumn(label: Text('Дни')),
      DataColumn(label: Text('1')),
      DataColumn(label: Text('2')),

      DataColumn(label: Text('3')),
      DataColumn(label: Text('4')),
      DataColumn(label: Text('5')),
      DataColumn(label: Text('6')),

      DataColumn(label: Text('7')),
    ];
  }

  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
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
