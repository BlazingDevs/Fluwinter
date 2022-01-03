import 'dart:io';
import 'package:cafegation/page/logo_page/logoPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  if(!(Platform.isAndroid || Platform.isIOS)){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDi9VS9_ovimWTHSxamGDycVMLM_mGtvNY",
        authDomain: "cafegation.firebaseapp.com",
        projectId: "cafegation",
        storageBucket: "cafegation.appspot.com",
        messagingSenderId: "898555262184",
        appId: "1:898555262184:web:587451332320a73857455d"
      )
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Page',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: logoPage(),
    );
  }
}

