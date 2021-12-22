import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/search_page/searchPage.dart';
import 'package:flutter/material.dart';

class logoPage extends StatefulWidget {
  @override
  _logoPageState createState() => _logoPageState();
}

class _logoPageState extends State<logoPage> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => searchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Center(
            child: Container(
          child: Text(
            "카페게이션",
            style: TextStyle(fontSize: 45.0, color: Colors.pinkAccent),
          ),
        )));
  }
}
