import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/api.dart';
import '../models/get_all_peopple.dart';
import '../style.dart';
import 'forklift.dart';

class Panel extends StatelessWidget {
  const Panel({super.key});

  Future<Forklifts> _loadData() async {
    final dynamic people = await ApiReq.getAllPeople();
    final modelList = await AllPeople.fromMap(people);
    // return await AllPeople.fromMap(people).list;
    // return await ApiReq.getInfoPeople(modelList.list.toString());
    return await modelList.list.first.forklifts.first;
  }

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
          color: TSC.base.withOpacity(0.5),
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
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Image.asset('assets/f6.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Image.asset('assets/f7.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Image.asset('assets/f8.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(child: Image.asset('assets/f9.png')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// return Expanded(
// child: ListView.builder(
// padding: const EdgeInsets.all(17.0),
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// itemCount: 7,
// itemBuilder:
//
//
// },
// ),
// );
