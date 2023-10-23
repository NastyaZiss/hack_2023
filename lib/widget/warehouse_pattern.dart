import 'dart:async';

import 'package:axenix_mov/widget/warehouse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import '../models/postg.dart';


List<WWW> listStreamFromAnimation = [];

// final CustomPositionedWidgetController _controller =
//     CustomPositionedWidgetController(
//   padding: const EdgeInsets.all(10),
//   canGoOffParentBounds: false,
// );

// AnimationController? nodesListAnimationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 350),
//     );
// Animation<double>? nodesListAnimation = Tween(begin: 10.0, end: ).animate(nodesListAnimationController);
// ;

class WWW {
  int id;
  StreamController<PosirionPogruz> controller;
  WWW(this.controller, this.id);
}

class Warehouse extends StatelessWidget {
  const Warehouse({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return AdaptiveBuilder(
      xs: (context) => Ware(
        scale: 0.9,
        top: 0,
        left: 150,
      ),
      sm: (context) => Ware(
        scale: 0.9,
        top: 0,
        left: 90,
      ),
      md: (context) => Ware(
        scale: 1.4,
        top: 150,
        left: 300,
      ),
      lg: (context) => Ware(
        top: 300,
        left: 800,
        scale: 2,
      ),
    );
  }
}