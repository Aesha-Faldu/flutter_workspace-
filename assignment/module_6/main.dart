import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test1/firstpage.dart';

import 'homepage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAlIU2jgjHGt891ZeLV1uQcqgmloIBUDu0',
        appId: '1:546322049862:android:36eb989c267028dc3ad347',
        messagingSenderId: '546322049862',
        projectId: 'aesha-fe780'),
  ):Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
MyApp({super.key});
  Color primeColor= Color(0xFF301d88);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Notebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primeColor),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null)?HomePage():FirstPage(),
    );
  }
}


