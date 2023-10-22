import 'dart:io';

import 'package:axenix_mov/data/socket_logic.dart';
import 'package:dio/dio.dart';

class ApiReq {

  static String basicUrl = 'https://tomioka.ru:6078';

  static Future<dynamic> getAllPeople() async {
    final String url = '$basicUrl/warehouses';
    final result = await Dio().get(url);
    return result.data;
  }

  static Future<dynamic> getInfoPeople(String idWork) async {
    final String url = '$basicUrl/$idWork';
    final result = await Dio().get(
      url,
    );
    return result.data;
  }

  static Future<dynamic> getInfoPeopleToTask(
      {required String idWork, required String idTask}) async {
    String url = '$basicUrl/$idWork/task/$idTask';
    var result = await Dio().get(
      url,
    );
    return result.data;
  }

}

void test() async {
  HttpOverrides.global = MyHttpOverrides();
  final List<Map>? people = await ApiReq.getAllPeople();
  print(people);
  if(people == null){
    return;
  }
  final Map? peopleInfo = await ApiReq.getInfoPeople(people.first['id']);
  print(peopleInfo);
}