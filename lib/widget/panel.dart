import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';
import 'buttons_forklift.dart';

class Panel extends StatelessWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: h < 300 ? w * 0.3 : h * 0.6,
        height: h * 0.8,
        decoration: BoxDecoration(
          color:  TSC.base.withOpacity(0.5),
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
                'Погрузчик',
                style: TSC.boldTitle,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(17.0),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'id ${index}',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
