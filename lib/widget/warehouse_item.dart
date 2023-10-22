import 'package:flutter/cupertino.dart';

import '../style.dart';

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
