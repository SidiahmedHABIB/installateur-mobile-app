import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  // // Connect to the WebSocket endpoint
  // // final channel =
  // //     WebSocketChannel.connect(Uri.parse('ws://192.168.1.17:8081/ws'));
  // final channel = IOWebSocketChannel.connect('wss://ws.bitstamp.net');
  // //channel.sink.add('SUBSCRIBE\nid:2\ndestination:/user/specific\n\n');
  // final message = {
  //   "event": "hello",
  //   "data": {"channel": "live_trades_btcusd"}
  // };
  // print(jsonEncode(message));
  // channel.sink.add(jsonEncode(message));
  // channel.stream.listen((message) {
  //   print('Received message: $message');
  // });

  runApp(const MyApp());
}
