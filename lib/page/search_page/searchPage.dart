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
        shadowColor: kGreyColor,
        title: Text('Search Page'),
        ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(children: <Widget>[
              SearchBar(),
              InkWell(
                 child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                    Text('내 주변 카페 찾기',style: 
                      TextStyle(fontSize: 20.0),)
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
              InkWell(
                child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                    Text('카테고리별 카페 찾기',style: 
                      TextStyle(fontSize: 20.0),)
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
              InkWell(
                child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                      Text('즐겨찾는 카페 찾기',style: 
                        TextStyle(fontSize: 20.0),)
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
    );
  }
}