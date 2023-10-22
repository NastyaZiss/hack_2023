import 'package:flutter/material.dart';

import '../style.dart';
import '../widget/button_app_disible.dart';
import '../widget/drop_list.dart';
import '../widget/table.dart';

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
                    child: ListView(
                      padding: const EdgeInsets.all(17.0),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: const [
                        TableC(text: 'Пройденное растояние',),
                        TableC(text: 'Выполненинные заказы',),
                        TableC(text: 'Время проведённое в движении',),
                        TableC(text: 'Время нахождения в каждом из статусов',),
                      ],
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
}
