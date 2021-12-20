import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:flutter/material.dart';

class listPage extends StatefulWidget {
  const listPage({ Key? key }) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: Text('list Page'),
        ),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 80% of our total height
            height: 800,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8).withOpacity(0.3),
            ),
          ),
          SafeArea(
            child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:    ListView.separated(
        itemCount : 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () { 
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => detailPage()
                      ),
                   );
            },
            title: Text('카페 이름',style: TextStyle(fontSize: 20.0),),
            leading: Text("1"),
            contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal:0.0),
            );
          }, 
      separatorBuilder:  (context, index) {
        return Divider();
      } ,
    ),
      )
      ),
        ]
      ),
    );
  }
}