import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/search_page/searchPage.dart';
import 'package:flutter/material.dart';

class logoPage extends StatefulWidget {
  const logoPage({ Key? key }) : super(key: key);

  @override
  _logoPageState createState() => _logoPageState();
}

class _logoPageState extends State<logoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kYellowColor,
      body: Center(
        child: Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Text('카페게이션\n(아랫부분 클릭시 다음페이지 이동)',
                style: TextStyle(fontSize: 28.0),
                ),
              Expanded(child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => searchPage()
              )
              );
              },
              )
              )
            ],
            ),
      ),
    );
  }
}