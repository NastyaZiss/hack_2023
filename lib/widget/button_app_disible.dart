import 'package:flutter/material.dart';

import '../style.dart';

class ButtonAppBarDisible extends StatelessWidget {
  const ButtonAppBarDisible(
      {super.key,
      required this.small,
      required this.text,
      required this.onPressed});
  final bool small;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black38,
        primary: TSC.base.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
        elevation: 0,
      ),
      child: Row(
        children: [
          const Icon(Icons.analytics_outlined),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: small ? TSC.boldTitlePhone : TSC.boldTitle,
          )
        ],
      ),
    );
  }
}
