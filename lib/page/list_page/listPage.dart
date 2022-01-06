import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:flutter/material.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7B938),
        shadowColor: kGreyColor,
        title: Text('list Page'),
      ),
      body: Stack(children: <Widget>[
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => detailPage()),
                  );
                },
                title: Text(
                  'CAFENAMU',
                  style: TextStyle(fontSize: 22.0),
                ),
                subtitle: Text(
                  "  08:00 ~ 22:00\n  홍익대학교 정문 L층",
                  style: TextStyle(fontSize: 14.0),
                ),
                leading: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image(
                      image: NetworkImage(
                          'https://coffee.dankook.ac.kr/html_portlet_repositories/images/ExtImgFile/10158/1766093/1952287/42012.png'),
                    )),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 25.0,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        )),
      ]),
    );
  }
}
