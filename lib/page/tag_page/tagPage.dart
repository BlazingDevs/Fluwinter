import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/list_page/listPage.dart';
import 'package:flutter/material.dart';

class tagPage extends StatefulWidget {
  const tagPage({ Key? key }) : super(key: key);

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
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(children: <Widget>[
              InkWell(
                 child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                    Text('콘센트가 많은',style: 
                      TextStyle(fontSize: 20.0),)
                    ],
                  ),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => listPage()
                      ),
                   );
                },
                ),
              InkWell(
                child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                    Text('조용한',style: 
                      TextStyle(fontSize: 20.0),)
                    ],
                  ),
                  onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => listPage()
                      ),
                   );
                },
                ),
              InkWell(
                child: Row(
                  children: [
                    SizedBox(width: 20,height: 20,),
                      Text('디저트가 맛있는',style: 
                        TextStyle(fontSize: 20.0),)
                      ],
                ),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => listPage()
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