import 'package:cafegation/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
//02.02(수) push 기준 쓸데없는 페이지임. 02.28 기준 안 쓸데없음.
const String kakaoMapKey = '258df8a7062d2ae5f0006f6e0b6796a9';

void main() {
  runApp(MaterialApp(home: KakaoMapTest()));
}

class KakaoMapTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _mapController;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('내 주변 카페 찾기')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KakaoMapView(
              width: size.width,
              height: 650,
              kakaoMapKey: kakaoMapKey,
              lat:37.552590921387676, 
              lng:126.9248596640318,
              showMapTypeControl: true,
              showZoomControl: true,
              draggableMarker: true,
              mapType: MapType.BICYCLE,
              mapController: (controller) {
                _mapController = controller;
              },
              polygon: KakaoPolygon(
                  polygon: [
                    KakaoLatLng(37.54437685093866, 126.92296870883536),
                    KakaoLatLng(37.54717721045083, 126.90873476390736),
                    KakaoLatLng(37.54717721045083, 126.90873476390736),
                    KakaoLatLng(37.562901433668124, 126.92638442980359),
                    KakaoLatLng(37.55505425341539, 126.93678586780096),
                    KakaoLatLng(37.54415008748556, 126.92946099846323)
                  ],
                  polygonColor: Colors.red,
                  polygonColorOpacity: 0,
                  strokeColor: Colors.black,
                  strokeWeight: 2.5,
                  strokeColorOpacity: 0.9),
              overlayText: '홍익대학교',
              customOverlayStyle: '''<style>
              .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
              </style>''',
              customOverlay: '''
var content = '<div class="customoverlay">' +
    '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
    '    <span class="title">카카오!</span>' +
    '  </a>' +
    '</div>';

var position = new kakao.maps.LatLng(33.450701, 126.570667);

var customOverlay = new kakao.maps.CustomOverlay({
    map: map,
    position: position,
    content: content,
    yAnchor: 1
});
              ''',
              markerImageURL:
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              onTapMarker: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message.message)));
              },
              zoomChanged: (message) {
                debugPrint('current zoom level : ${message.message}');
              },
              cameraIdle: (message) {
                KakaoMapUtil util = KakaoMapUtil();
                KakaoLatLng latlng = util.getLatLng(message.message);
                debugPrint('current lat lng : ${latlng.lat}, ${latlng.lng}');
              }),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     InkWell(
          //       onTap: () {
          //         _mapController.evaluateJavascript(
          //             'map.setLevel(map.getLevel() - 1, {animate: true})');
          //       },
          //       child: CircleAvatar(
          //         backgroundColor: Colors.red,
          //         child: const Icon(
          //           Icons.remove,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         _mapController.evaluateJavascript(
          //             'map.setLevel(map.getLevel() + 1, {animate: true})');
          //       },
          //       child: CircleAvatar(
          //         backgroundColor: Colors.blue,
          //         child: const Icon(
          //           Icons.add,
          //           color: Colors.white,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            primary: Colors.blue[200],
                            onPrimary: Colors.black),
              child: Text('kakao map open'),
              onPressed: () async {
                await _openKakaoMapScreen(context);
              })
        ],
      ),
    );
  }

  Future<void> _openKakaoMapScreen(BuildContext context) async {
    KakaoMapUtil util = KakaoMapUtil();

    // String url = await util.getResolvedLink(
    //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

    /// This is short form of the above comment
    String url =
        await util.getMapScreenURL(37.5515814, 126.9227864, name: '홍익대학교');

    debugPrint('url : $url');

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }

  Widget _testingCustomScript(
      {required Size size, required BuildContext context}) {
    return KakaoMapView(
        width: size.width,
        height: 400,
        kakaoMapKey: kakaoMapKey,
        lat: 33.450701,
        lng: 126.570667,
        customScript: '''
    var markers = ['피오니'];
    
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
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        });
  }
}

// class mapPage extends StatefulWidget {
//   const mapPage({Key? key}) : super(key: key);

//   @override
//   _mapPageState createState() => _mapPageState();
// }

// class _mapPageState extends State<mapPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.transparent,
//         shadowColor: kGreyColor,
//         title: Text('Map Page'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.add_location),
//               onPressed: () {
//                 print("location button is pressed");
//               })
//         ],
//       ),
//     );
//   }
// }
