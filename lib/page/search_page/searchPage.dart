import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/favorites_page/favoritesPage.dart';
import 'package:cafegation/page/map_page/mapPage.dart';
import 'package:cafegation/page/search_page/searchbar.dart';
import 'package:cafegation/page/tag_page/tagPage.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        shadowColor: Colors.blue[300],
        title: Text('Search Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SearchBar(),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            primary: Color(0xFF2C2E43),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mapPage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.location_on,color: Colors.white,),
                            SizedBox(width: 15,),
                            Text(
                            '내 주변 카페 찾기',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.normal),
                          ),]
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            primary: Color(0xFF2C2E43),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tagPage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.menu,color: Colors.white,),
                            SizedBox(width: 15,),
                            Text(
                            '카테고리별 카페 찾기',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.normal),
                          ),]
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            primary: Color(0xFF2C2E43),
                            onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => favoritesPage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.favorite_border,color: Colors.white,),
                            SizedBox(width: 15,),
                            Text(
                            '즐겨찾는 카페 찾기',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.normal),
                          ),]
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
