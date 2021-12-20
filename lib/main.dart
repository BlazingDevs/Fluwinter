import 'package:cafegation/page/logo_page/logoPage.dart';
import 'package:flutter/material.dart';
import 'constants/colors.dart';

void main() {
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
        scaffoldBackgroundColor: kGreyColor,
        primarySwatch: Colors.blue,
      ),
      home: logoPage(),
    );
  }
}

