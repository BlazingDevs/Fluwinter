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
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => searchPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/Cafegationlogo.png'),
                ),
                Text(
                  'Cafegation',
                  style: TextStyle(
                      fontFamily: 'Signika', fontSize: 30.0, color: Colors.black,letterSpacing: 2.5,),
                ),
                SizedBox(height: 20.0,width: 200.0,child: Divider(color: Colors.black,),),
                Text(
                  'cafe navigation',
                  style: TextStyle(
                      fontFamily: 'SourceSans', fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.normal,letterSpacing: 5.0,),
                ),
              ],
            ),
          ),
        ));
  }
}
/*
Container(
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
                      fontFamily: 'Signika', fontSize: 50.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),*/