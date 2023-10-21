import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key, required this.horiz, required this.width});
  final bool horiz;
  final double width;

  @override
  Widget build(BuildContext context) {
    return horiz
        ? Container(
            color: Colors.blue,
            height: 2,
            width: width,
          )
        : Container(
            color: Colors.blue,
            height: width,
            width: 2,
          );
  }
}
