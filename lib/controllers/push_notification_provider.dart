import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:demo1/controllers/token.dart';


class PushNotificationsProvider {
  final Token _token = new Token();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajesStream => _mensajesStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final tokeen = await _firebaseMessaging.getToken();
    _token.idt = tokeen.toString();
    print('==== FCM Token ======');
    print(tokeen);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage:
          Platform.isIOS ? null : PushNotificationsProvider.onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('====== onMessage ====== ');
    print('message: $message');
    // print('argumento: $argumento');
    String argumento = 'no-data';

    if (Platform.isAndroid) {
      argumento = message['data']['comida'] ?? 'no-data';
    } else {
      argumento = message['comida'] ?? 'no-data';
    }

    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('====== onLaunch ====== ');
    // print('message: $message');
    // print('argumento: $argumento');
    String argumento = 'no-data';

    if (Platform.isAndroid) {
      argumento = message['data']['comida'] ?? 'no-data';
    } else {
      argumento = message['comida'] ?? 'no-data';
    }

    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('====== onResume ====== ');
    // print('message: $message');
    // print('argumento: $argumento');
    String argumento = 'no-data';

    if (Platform.isAndroid) {
      argumento = message['data']['comida'] ?? 'no-data';
    } else {
      argumento = message['comida'] ?? 'no-data';
    }

    _mensajesStreamController.sink.add(argumento);
  }

  dispose() {
    _mensajesStreamController?.close();
  }
  
}