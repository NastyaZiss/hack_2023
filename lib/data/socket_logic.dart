import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class Socketlogic {
  static WebSocketChannel? channel;

  static void connect() {
    HttpOverrides.global = MyHttpOverrides();
    String url = 'wss://tomioka.ru:6078/warehouses/1/events/listen';
    final wsUrl = Uri.parse(url);
    channel = WebSocketChannel.connect(wsUrl);
  }

  static void listen(Function(Map) event) {
    channel!.stream.listen((message) {
      final Map map = jsonDecode(message);
      if (map.containsKey('event')) {
        final String eventType = map['event'];
        switch (eventType) {
          case 'forklift.movement':
            _event_forklift_movement(map);
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

  static void _event_forklift_movement(Map data) {
    ///Example
    //{"event":"forklift.movement","data":{"current_location":{"x":25,"y":10},"inferred_location":{"x":15,"y":10},"speed":2.5}}
  }
  static void sendEvent({
    required String event,
    required Map data,
  }) {
    final Map dataSend = {"event": event, "data": data};
    channel!.sink.add(dataSend);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
