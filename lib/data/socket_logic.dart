// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:axenix_mov/widget/warehouse.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/postg.dart';
import '../widget/warehouse_pattern.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Socketlogic {
  static WebSocketChannel? channel;

  static void connect() {
    HttpOverrides.global = MyHttpOverrides();
    String url = 'wss://tomioka.ru:6078/warehouses/1/events/listen';
    final wsUrl = Uri.parse(url);
    channel = WebSocketChannel.connect(wsUrl);
  }

  static DateTime time = DateTime.now();

  static void listen(Function(Map) event) {
    channel!.stream.listen((message) {
      if ((DateTime.now().millisecondsSinceEpoch - 8000) >
          (time.millisecondsSinceEpoch)) {
        time = DateTime.now();
      } else {
        return;
      }
      final mapWWeee = json.decode(message);
      // final StreamEventModel model = StreamEventModel.fromMap(mapWWeee['data']);
      // final dynamic mapWW = message as Map;
      if (mapWWeee.containsKey('event')) {
        final String eventType = mapWWeee['event'];
        switch (eventType) {
          case 'forklift.movement':
            _event_forklift_movement(mapWWeee);
            break;
          // case '' :
          // _method(map);
          // break;
          default:
            break;
        }
        ;
        print(message);
      } else {
        print(message);
      }
    });
  }

  static void disconnect() {
    channel!.sink.close(status.goingAway);
  }

  static void _event_forklift_movement(Map<String, dynamic> data) async {
    ///Example
    //{"event":"forklift.movement","data":{"forklift_id": 1,, "current_location":{"x":25,"y":10},"inferred_location":{"x":15,"y":10},"speed":2.5}}
    final StreamEventModel model = StreamEventModel.fromMap(data['data']);
    final mapStrnig = listStreamFromAnimation.map((e) => e.id).toList();
    if (mapStrnig.contains(model.forklift_id)) {
      final data = listStreamFromAnimation
          .firstWhere((element) => element.id == model.forklift_id);
      final controolerrGet = data.controller;
      controolerrGet.add(
          PosirionPogruz(model.current_location.x, model.current_location.y));
    }
  }

  static void sendEvent({
    required String event,
    required Map data,
  }) {
    final Map dataSend = {"event": event, "data": data};
    channel!.sink.add(dataSend);
  }
}

class StreamEventModel {
  int forklift_id;
  PosisiotnedModel current_location;
  PosisiotnedModel inferred_location;
  double speed;
  StreamEventModel({
    required this.forklift_id,
    required this.current_location,
    required this.inferred_location,
    required this.speed,
  });

  StreamEventModel copyWith({
    int? forklift_id,
    PosisiotnedModel? current_location,
    PosisiotnedModel? inferred_location,
    double? speed,
  }) {
    return StreamEventModel(
      forklift_id: forklift_id ?? this.forklift_id,
      current_location: current_location ?? this.current_location,
      inferred_location: inferred_location ?? this.inferred_location,
      speed: speed ?? this.speed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forklift_id': forklift_id,
      'current_location': current_location.toMap(),
      'inferred_location': inferred_location.toMap(),
      'speed': speed,
    };
  }

  factory StreamEventModel.fromMap(Map<String, dynamic> map) {
    return StreamEventModel(
      forklift_id: map['forklift_id'] as int,
      current_location: PosisiotnedModel.fromMap(
          map['current_location'] as Map<String, dynamic>),
      inferred_location: PosisiotnedModel.fromMap(
          map['inferred_location'] as Map<String, dynamic>),
      speed: map['speed'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamEventModel.fromJson(String source) =>
      StreamEventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StreamEventModel(forklift_id: $forklift_id, current_location: $current_location, inferred_location: $inferred_location, speed: $speed)';
  }

  @override
  bool operator ==(covariant StreamEventModel other) {
    if (identical(this, other)) return true;

    return other.forklift_id == forklift_id &&
        other.current_location == current_location &&
        other.inferred_location == inferred_location &&
        other.speed == speed;
  }

  @override
  int get hashCode {
    return forklift_id.hashCode ^
        current_location.hashCode ^
        inferred_location.hashCode ^
        speed.hashCode;
  }
}

class PosisiotnedModel {
  double x;
  double y;
  PosisiotnedModel({
    required this.x,
    required this.y,
  });

  PosisiotnedModel copyWith({
    double? x,
    double? y,
  }) {
    return PosisiotnedModel(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
    };
  }

  factory PosisiotnedModel.fromMap(Map<String, dynamic> map) {
    return PosisiotnedModel(
      x: map['x'] as double,
      y: map['y'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PosisiotnedModel.fromJson(String source) =>
      PosisiotnedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PosisiotnedModel(x: $x, y: $y)';

  @override
  bool operator ==(covariant PosisiotnedModel other) {
    if (identical(this, other)) return true;

    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
