import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/favorites_page/favoritesPage.dart';
import 'package:cafegation/page/map_page/mapPage.dart';
import 'package:cafegation/page/search_page/searchbar.dart';
import 'package:cafegation/page/tag_page/tagPage.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'dart:io' show Platform;

class searchPage extends StatefulWidget {
  static String id = 'searchpage';
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
        automaticallyImplyLeading: false,
        leading: const SizedBox(
          width: 100,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout_rounded))
        ],
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => KakaoMapTest()));
                          // _openKakaoMapScreen(context);
                        },
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '내 주변 카페 찾기',
                            style: TextStyle(color: Colors.white, fontSize: 23.0, letterSpacing: 5.0, fontWeight: FontWeight.normal),
                          ),
                        ]),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => tagPage()));
                        },
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '카테고리별 카페 찾기',
                            style: TextStyle(color: Colors.white, fontSize: 23.0, letterSpacing: 5.0, fontWeight: FontWeight.normal),
                          ),
                        ]),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => favoritesPage()));
                        },
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '즐겨찾는 카페 찾기',
                            style: TextStyle(color: Colors.white, fontSize: 23.0, letterSpacing: 5.0, fontWeight: FontWeight.normal),
                          ),
                        ]),
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

Future<void> _openKakaoMapScreen(BuildContext context) async {
  KakaoMapUtil util = KakaoMapUtil();

  // String url = await util.getResolvedLink(
  //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

  /// This is short form of the above comment
  String url = await util.getMapScreenURL(37.5515814, 126.9227864, name: '홍익대학교');

  debugPrint('url : $url');

  Navigator.push(context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
}

Widget _testingCustomScript({required Size size, required BuildContext context}) {
  return KakaoMapView(
      width: size.width,
      height: 400,
      kakaoMapKey: '258df8a7062d2ae5f0006f6e0b6796a9',
      lat: 33.450701,
      lng: 126.570667,
      customScript: '''
    var markers = [];
    
    function addMarker(position) {
    
      var marker = new kakao.maps.Marker({position: position});

      marker.setMap(map);
    
      markers.push(marker);
    }
    
    for(var i = 0 ; i < 3 ; i++){
      addMarker(new kakao.maps.LatLng(33.450701 + 0.0003 * i, 126.570667 + 0.0003 * i));
      
      kakao.maps.event.addListener(markers[i], 'click', function(){
        onTapMarker.postMessage('marker ' + i + ' is tapped');
     });
    }
    
		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    
              ''',
      onTapMarker: (message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
      });
}
