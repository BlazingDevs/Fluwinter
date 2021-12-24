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
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: Text('Tag Page'),
      ),
      body: Center(
        child: Row(children: <Widget>[
          SizedBox(width: 30),
          Stack(
            children: <Widget>[
              Container(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
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
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
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
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#디저트가 맛있는',
                          style: TextStyle(
                              fontSize: 20.0,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
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
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
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
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[100],
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listPage()));
                        },
                        child: Text(
                          '#커피가 맛있는',
                          style: TextStyle(
                              fontSize: 20.0,
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
