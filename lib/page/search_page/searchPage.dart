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
              child: Column(children: <Widget>[
                SearchBar(),
                SizedBox(height: 30,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 390,
                    height: 120,
                    color: Colors.green[100],
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
                        InkWell(
                          customBorder:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                          child: Row(
                            children: [
                          SizedBox(width: 60 ,),
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
                    SizedBox(height: 30,),  
                      ],),
                  ),
                ),
                SizedBox(height: 30,),  
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 390,
                    height: 120,
                    color: Colors.blue[100],
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
                          InkWell(
                        child: Row(
                          children: [
                          SizedBox(width: 40,),
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
                    SizedBox(height: 30,),  
                      ],),
                  ),
                ),
                SizedBox(height: 30,),  
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 390,
                    height: 120,
                    color: Colors.purple[100],
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),  
                        InkWell(
                          child: Row(
                            children: [
                            SizedBox(width: 50),
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
                          
                        ),
                        SizedBox(height: 30,),  
                  ],
                  ),
                  ),
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