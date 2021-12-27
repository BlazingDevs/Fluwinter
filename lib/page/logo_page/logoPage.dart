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
      backgroundColor: Colors.brown,
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF7B938)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(" "),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Cafégation",
                  style: TextStyle(
                      fontFamily: 'oswa', fontSize: 50.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
