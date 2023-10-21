import 'package:axenix_mov/widget/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../style.dart';
import 'line.dart';

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return AdaptiveBuilder(
      xs: (context) => const Ware(
        scale: 0.9,
        top: 0,
        left: 150,
      ),
      sm: (context) => const Ware(
        scale: 0.9,
        top: 0,
        left: 90,
      ),
      md: (context) => const Ware(
        scale: 1.2,
        top: 150,
        left: 200,
      ),
      lg: (context) => const Ware(
        top: 300,
        left: 500,
        scale: 2,
      ),
    );
  }
}

class Ware extends StatelessWidget {
  const Ware(
      {super.key, required this.scale, required this.top, required this.left});
  final double scale;

  final double top;
  final double left;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: InteractiveViewer(
            panEnabled: false, // Set it to false
            boundaryMargin: EdgeInsets.all(100),
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
                      child: const Stack(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WareHouse extends StatelessWidget {
  const WareHouse({super.key, required this.text, required this.small});

  final String text;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: !small ? 150 : 80,
      child: Center(
          child: Text(
        text,
        style: TSC.boldTitlePhone,
      )),
      decoration: BoxDecoration(
          color: TSC.base,
          borderRadius: small
              ? const BorderRadius.only(
                  bottomLeft: (Radius.circular(5)),
                  topLeft: (Radius.circular(5)))
              : const BorderRadius.only(
                  bottomRight: (Radius.circular(5)),
                  topRight: (Radius.circular(5)))),
    );
  }
}
