import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/search_page/searchPage.dart';
import 'package:flutter/material.dart';

class logoPage extends StatefulWidget {
  @override
  _logoPageState createState() => _logoPageState();
}

class _logoPageState extends State<logoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchPage()));
                },
              ),
              flex: 3,
            ),
            Expanded(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => searchPage()));
                  },
                  child: Container(
                    width: 2500,
                    child: Text(
                      'Cafégation',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xFFef39a9), fontSize: 50.0),
                    ),
                  )),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchPage()));
                },
                child: Container(
                  width: 2500,
                  child: Text(
                    '클릭하여 다음으로 이동',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFe797c8), fontSize: 25.0),
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchPage()));
                },
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
