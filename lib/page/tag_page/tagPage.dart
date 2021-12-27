import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/list_page/listPage.dart';
import 'package:flutter/material.dart';

class tagPage extends StatefulWidget {
  const tagPage({Key? key}) : super(key: key);

  @override
  _tagPageState createState() => _tagPageState();
}

class _tagPageState extends State<tagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shadowColor: Colors.orange,
        title: Text('Tag Page'),
      ),
      body: Center(
        child: Row(children: <Widget>[
          SizedBox(width: 30),
          Stack(
            children: <Widget>[
              Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 90),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            primary: Color(0xFF2C2E43),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#분위기 있는',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            primary: Color(0xFFB2B1B9),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#조용한',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          primary: Color(0xFF2C2E43),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#디저트 맛집인',
                          style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 30),
          Stack(
            children: <Widget>[
              Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 90),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            primary: Color(0xFF2C2E43),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#이야기하기 좋은',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            primary: Color(0xFFB2B1B9),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#콘센트 많은',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          primary: Color(0xFF2C2E43),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#커피 맛집인',
                          style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
