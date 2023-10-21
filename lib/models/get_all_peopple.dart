// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../data/api.dart';
import '../data/socket_logic.dart';

/// Модель для запроса погрузчиков
class Warehouses {
  List<People> list;
  Warehouses({
    required this.list,
  });

  Warehouses copyWith({
    List<People>? list,
  }) {
    return Warehouses(
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory Warehouses.fromMap(List<dynamic> dataList) {
    return Warehouses(
      list: List<People>.from(
        dataList.map<People>(
          (x) => People.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Warehouses.fromJson(String source) =>
      Warehouses.fromMap(json.decode(source));

  @override
  String toString() => 'AllPeople(list: $list)';

  @override
  bool operator ==(covariant Warehouses other) {
    if (identical(this, other)) return true;

    return listEquals(other.list, list);
  }

  @override
  int get hashCode => list.hashCode;
}

///
class People {
  int id;
  List<Checkpoint> checkpoints;
  List<Forklifts> forklifts;
  People({
    required this.id,
    required this.checkpoints,
    required this.forklifts,
  });

  People copyWith({
    int? id,
    List<Checkpoint>? checkpoints,
    List<Forklifts>? forklifts,
  }) {
    return People(
      id: id ?? this.id,
      checkpoints: checkpoints ?? this.checkpoints,
      forklifts: forklifts ?? this.forklifts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkpoints': checkpoints.map((x) => x.toMap()).toList(),
      'forklifts': forklifts.map((x) => x.toMap()).toList(),
    };
  }

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      id: map['id'] as int,
      checkpoints: List<Checkpoint>.from(
        (map['checkpoints'] as List<dynamic>).map<Checkpoint>(
          (x) => Checkpoint.fromMap(x as Map<String, dynamic>),
        ),
      ),
      forklifts: List<Forklifts>.from(
        (map['forklifts'] as List<dynamic>).map<Forklifts>(
          (x) => Forklifts.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory People.fromJson(String source) =>
      People.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'People(id: $id, checkpoints: $checkpoints, forklifts: $forklifts)';

  @override
  bool operator ==(covariant People other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.checkpoints, checkpoints) &&
        listEquals(other.forklifts, forklifts);
  }

  @override
  int get hashCode => id.hashCode ^ checkpoints.hashCode ^ forklifts.hashCode;
}

class Checkpoint {
  int id;
  int warehouse_id;
  int location_x;
  int location_y;
  Checkpoint({
    required this.id,
    required this.warehouse_id,
    required this.location_x,
    required this.location_y,
  });

  Checkpoint copyWith({
    int? id,
    int? warehouse_id,
    int? location_x,
    int? location_y,
  }) {
    return Checkpoint(
      id: id ?? this.id,
      warehouse_id: warehouse_id ?? this.warehouse_id,
      location_x: location_x ?? this.location_x,
      location_y: location_y ?? this.location_y,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'warehouse_id': warehouse_id,
      'location_x': location_x,
      'location_y': location_y,
    };
  }

  factory Checkpoint.fromMap(Map<String, dynamic> map) {
    return Checkpoint(
      id: map['id'] as int,
      warehouse_id: map['warehouse_id'] as int,
      location_x: map['location_x'] as int,
      location_y: map['location_y'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Checkpoint.fromJson(String source) =>
      Checkpoint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Checkpoint(id: $id, warehouse_id: $warehouse_id, location_x: $location_x, location_y: $location_y)';
  }

  @override
  bool operator ==(covariant Checkpoint other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.warehouse_id == warehouse_id &&
        other.location_x == location_x &&
        other.location_y == location_y;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        warehouse_id.hashCode ^
        location_x.hashCode ^
        location_y.hashCode;
  }
}

class Forklifts {
  int id;
  Forklifts({
    required this.id,
  });

  Forklifts copyWith({
    int? id,
  }) {
    return Forklifts(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory Forklifts.fromMap(Map<String, dynamic> map) {
    return Forklifts(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forklifts.fromJson(String source) =>
      Forklifts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Forklifts(id: $id)';

  @override
  bool operator ==(covariant Forklifts other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
// }
// void _incrementCounter() async {
//   HttpOverrides.global = MyHttpOverrides();
//   final dynamic people = await ApiReq.getAllPeople();
//   print(people);
//   final modelList = AllPeople.fromMap(people);
//   final peopleInfo = await ApiReq.getInfoPeople(modelList.list.first.checkpoints.first.warehouse_id); //(people.first['checkpoints'] as List).first['warehouse_id'].toString()
//   print(peopleInfo);
}
