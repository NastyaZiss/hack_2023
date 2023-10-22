import 'dart:async';

import 'package:axenix_mov/data/api.dart';
import 'package:axenix_mov/data/socket_logic.dart';
import 'package:axenix_mov/models/get_all_peopple.dart';
import 'package:axenix_mov/widget/k.dart';
import 'package:axenix_mov/widget/warehouse_item.dart';
import 'package:axenix_mov/widget/warehouse_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/postg.dart';
import 'line.dart';

class Ware extends StatelessWidget {
  Ware({super.key, required this.scale, required this.top, required this.left});
  final double scale;

  final double top;
  final double left;

  final StreamController<PosirionPogruz> _conteroller =
  StreamController<PosirionPogruz>();

  List<Positioned> generateWidget = [];

  Future<List<Positioned>> _loadData() async {
    final dynamic people = await ApiReq.getAllPeople();
    final modelList = AllPeople.fromMap(people);
    // final dynamic people2 = await ApiReq.getInfoPeople(modelList.list.first.forklifts.first.id);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Socketlogic.connect();
      Socketlogic.listen((p0) => null);
    });
    final list = modelList.list;
    final List<WWW> listStream = List.generate(
      list.first.forklifts.length,
          (index) => WWW(
        StreamController<PosirionPogruz>(),
        list.first.forklifts[index].id,
      ),
    );
    listStreamFromAnimation = listStream;
    final listWidget = List.generate(listStreamFromAnimation.length, (index) {
      return
        Positioned.fill(
          child: StreamBuilder<PosirionPogruz>(
              stream: listStreamFromAnimation[index].controller.stream,
              builder: (context, AsyncSnapshot<PosirionPogruz> snapshot) {
                // return  CustomPositionedWidget(
                //   // you need to use a key here to force a rebuild, otherwise use stateful widget
                //   key: UniqueKey(),
                //   // maxSize WILL be used here since the Column above does not force any size constraints
                //   maxSize: const Size(500, 500),
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.amber,
                //   ),
                //   controller: _controller,
                // );
                return Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        width: 50,
                        height: 50,
                        bottom: snapshot.data == null ? 10 : (snapshot.data!.y*10),
                        right: snapshot.data == null ? 10 : (snapshot.data!.x*10),
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Container(

                          width: 40,
                          height: 40,
                          child:  Image.asset('assets/forklift.png'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
    });
    generateWidget = listWidget;
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    // Future.delayed(const Duration(seconds: 6)).then((s) {
    //   listStreamFromAnimation.first.controller.add(PosirionPogruz(90, 130));
    // });

    return Expanded(
      child: FutureBuilder(
          future: _loadData(),
          builder: (context, assyncData) {
            return AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: top,
                        bottom: 0,
                        left: left,
                        child: Align(
                          alignment: Alignment.center,
                          child: Transform.scale(
                            scale: scale,
                            // scaleX: 20,
                            child: Stack(
                              // clipBehavior: Clip.hardEdge,
                              children: [
                                ///sklad 1
                                Positioned(
                                  top: 40,
                                  left: 0,
                                  child: WareHouse(
                                    text: 'x6',
                                    small: true,
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  left: 80,
                                  child: WareHouse(
                                    text: 'x5',
                                    small: false,
                                  ),
                                ),
                                Positioned(
                                    left: 40,
                                    top: 7,
                                    child: KWidget(
                                      text: 'K10',
                                    )),
                                Positioned(
                                    left: 140,
                                    top: 7,
                                    child: KWidget(
                                      text: 'K9',
                                    )),
                                Positioned(
                                    left: 250,
                                    top: 7,
                                    child: KWidget(
                                      text: 'K8',
                                    )),

                                /// line sklad 1
                                Positioned(
                                  top: 20,
                                  left: 30,
                                  child: Line(
                                    horiz: true,
                                    width: 10,
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 80,
                                  child: Line(
                                    horiz: true,
                                    width: 60,
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 180,
                                  child: Line(
                                    horiz: true,
                                    width: 70,
                                  ),
                                ),
                                // Positioned(
                                //   top: 2.1869,
                                //   left: 10,
                                //   child: Text(
                                //     '←',
                                //     style: TextStyle(fontSize: 24, color: Colors.blue),
                                //   ),
                                // ),

                                ///sklad2
                                Positioned(
                                  top: 125,
                                  left: 0,
                                  child: WareHouse(
                                    text: 'x4',
                                    small: true,
                                  ),
                                ),
                                Positioned(
                                  top: 125,
                                  left: 80,
                                  child: WareHouse(
                                    text: 'x3',
                                    small: false,
                                  ),
                                ),
                                Positioned(
                                    left: 250,
                                    top: 80,
                                    child: KWidget(
                                      text: 'K5',
                                    )),
                                Positioned(
                                    left: 140,
                                    top: 80,
                                    child: KWidget(
                                      text: 'K6',
                                    )),
                                Positioned(
                                    left: 40,
                                    top: 80,
                                    child: KWidget(
                                      text: 'K7',
                                    )),
                                // Positioned(
                                //   top: 75,
                                //   left: 10,
                                //   child: Text(
                                //     '←',
                                //     style: TextStyle(fontSize: 24, color: Colors.blue),
                                //   ),
                                // ),

                                /// line sklad 2
                                Positioned(
                                  top: 93,
                                  left: 180,
                                  child: Line(
                                    horiz: true,
                                    width: 70,
                                  ),
                                ),
                                Positioned(
                                  top: 93,
                                  left: 80,
                                  child: Line(
                                    horiz: true,
                                    width: 60,
                                  ),
                                ),
                                Positioned(
                                  top: 92.5,
                                  left: 30,
                                  child: Line(
                                    horiz: true,
                                    width: 10,
                                  ),
                                ),

                                ///sklad 3
                                Positioned(
                                  top: 200,
                                  left: 0,
                                  child: WareHouse(
                                    text: 'x2',
                                    small: true,
                                  ),
                                ),
                                Positioned(
                                  top: 200,
                                  left: 80,
                                  child: WareHouse(
                                    text: 'x1',
                                    small: false,
                                  ),
                                ),
                                Positioned(
                                    left: 40,
                                    top: 160,
                                    child: KWidget(
                                      text: 'K4',
                                    )),

                                Positioned(
                                    left: 140,
                                    top: 160,
                                    child: KWidget(
                                      text: 'K3',
                                    )),
                                Positioned(
                                    left: 250,
                                    top: 160,
                                    child: KWidget(
                                      text: 'K2',
                                    )),
                                // Positioned(
                                //     left: 300,
                                //     top: 400,
                                //     child: KWidget(
                                //       text: 'K6',
                                //     )),
                                Positioned(
                                    left: 250,
                                    top: 220,
                                    child: KWidget(
                                      text: 'K1',
                                    )),
                                // Positioned(
                                //     left: 950,
                                //     top: 600,
                                //     child: KWidget(
                                //       text: 'K6',
                                //     )),

                                /// line sklad 3
                                Positioned(
                                  top: 170,
                                  left: 180,
                                  child: Line(
                                    horiz: true,
                                    width: 70,
                                  ),
                                ),
                                Positioned(
                                  top: 167,
                                  left: 30,
                                  child: Line(
                                    horiz: true,
                                    width: 10,
                                  ),
                                ),
                                Positioned(
                                  top: 170,
                                  left: 80,
                                  child: Line(
                                    horiz: true,
                                    width: 60,
                                  ),
                                ),
                                // Positioned(
                                //   top: 148,
                                //   left: 10,
                                //   child: Text(
                                //     '←',
                                //     style: TextStyle(fontSize: 25, color: Colors.blue),
                                //   ),
                                // ),

                                ///line vertical
                                Positioned(
                                  top: 32,
                                  left: 270,
                                  child: Line(
                                    horiz: false,
                                    width: 50,
                                  ),
                                ),
                                Positioned(
                                  top: 105,
                                  left: 270,
                                  child: Line(
                                    horiz: false,
                                    width: 55,
                                  ),
                                ),
                                Positioned(
                                  top: 180,
                                  left: 270,
                                  child: Line(
                                    horiz: false,
                                    width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ]+(assyncData.data ?? []),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

