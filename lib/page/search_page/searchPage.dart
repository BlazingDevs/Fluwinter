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
      appBar: AppBar(
        backgroundColor: Colors.amber,
        shadowColor: Colors.orange,
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[100], onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mapPage()));
                        },
                        child: Text(
                          '내 주변 카페 찾기',
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[100], onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tagPage()));
                        },
                        child: Text(
                          '카테고리별 카페 찾기',
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[100], onPrimary: Colors.black),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => favoritesPage()));
                        },
                        child: Text(
                          '즐겨찾는 카페 찾기',
                          style: TextStyle(
                              fontSize: 30.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.normal),
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
