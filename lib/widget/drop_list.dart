import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropList extends StatelessWidget {
  const DropList({super.key, required this.onChanged, required this.list});
  final Function(String?)? onChanged;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 0),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          items: <String>['склад 1', 'склад 2', 'склад 3', 'склад 4']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            // This is called when the user selects an item.

            var dropdownValue = value!;
          },
        ));
  }
}
