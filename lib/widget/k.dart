import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class KWidget extends StatelessWidget {
  const KWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: const BorderRadius.all(
            (Radius.circular(5)),
          ),
        ),
    child: Center(child: Text(text,style: TSC.boldTitleD,)),);
  }
}
