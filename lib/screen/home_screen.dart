import 'package:axenix_mov/screen/analitical_screen.dart';
import 'package:axenix_mov/widget/button_app_disible.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import '../style.dart';
import '../widget/forklift.dart';
import '../widget/drop_list.dart';
import '../widget/panel.dart';
import '../widget/warehouse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = '1 склад';
  String dropdownValue = '1 скад';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Layout(
      child: AdaptiveBuilder(
        xs: (context) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0), // here the desired height
            child: AppBar(
              titleTextStyle:
                  TSC.boldTitlePhone.copyWith(color: Colors.black),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Image.asset('assets/logo5.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropList(
                        list: [],
                        onChanged: (String) {},
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
                          text: 'Аналитика',
                          onPressed: () {
                            Navigator.pushNamed(context, '/a');
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              elevation: 2,
              centerTitle: true,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 20, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AdaptiveBuilder(
                  xs: (context) => Panel(),
                  sm: (context) => Panel(),
                ),
                Warehouse()
              ],
            ),
          ),
        ),
        md: (context) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // here the desired height
            child: AppBar(
              titleTextStyle:
                  TSC.boldTitlePhone.copyWith(color: Colors.black),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset('assets/logo5.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropList(

                        list: [],
                        onChanged: (String) {},
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
                          text: 'Аналитика',
                          onPressed: () {
                            Navigator.pushNamed(context, '/a');
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              elevation: 2,
              centerTitle: true,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 20, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AdaptiveBuilder(
                  xs: (context) => Panel(),
                  sm: (context) => Panel(),
                ),
                Warehouse()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   child: const Icon(Icons.analytics_outlined, color: Colors.black),
//   onPressed: () {
//     // Do something
//   },
// ),
