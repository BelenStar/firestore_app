// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firestone_app/app.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void getInstallationId() async {
    String installationId = await FirebaseInstallations.instance.getId();

    print("Installation ID: $installationId");
  }

  getInstallationId();

  String? token = await messaging.getToken();
  print('FirebaseMessaging token: $token');

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  runApp(const MyApp());
}
