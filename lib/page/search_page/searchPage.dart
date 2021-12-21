import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/favorites_page/favoritesPage.dart';
import 'package:cafegation/page/map_page/mapPage.dart';
import 'package:cafegation/page/search_page/searchbar.dart';
import 'package:cafegation/page/tag_page/tagPage.dart';
import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({ Key? key }) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kMainColor,
        title: Text('Search Page'),
        ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.red[50],
              //),
              child: Column(children: <Widget>[
                SearchBar(),
                SizedBox(height: 40,),
                InkWell(
                   customBorder:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                   child: Row(
                    children: [
                      SizedBox(width: 100,),
                      Text('내 주변 카페 찾기',style: 
                        TextStyle(fontSize: 30.0, letterSpacing: 2.0,fontWeight: FontWeight.normal),)
                      ],
                    ),
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => mapPage()
                        ),
                     );
                  },
                  ),
                SizedBox(height: 40,),
                InkWell(
                  child: Row(
                    children: [
                      SizedBox(width: 90,),
                      Text('카테고리별 카페 찾기',style: 
                        TextStyle(fontSize: 30.0, letterSpacing: 2.0,fontWeight: FontWeight.normal),)
                      ],
                    ),
                    onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => tagPage()
                        ),
                     );
                  },
                  ),
                SizedBox(height: 40,),  
                InkWell(
                  child: Row(
                    children: [
                      SizedBox(width: 105),
                        Text('즐겨찾는 카페 찾기',style: 
                          TextStyle(fontSize: 30.0, letterSpacing: 2.0,fontWeight: FontWeight.normal),)
                        ],
                  ),
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => favoritesPage()
                        ),
                     );
                  },
                  
                )
              ],
              ),
              )
              ],
              ),
      ),
    );
  }
}