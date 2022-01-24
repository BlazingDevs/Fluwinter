import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  bool favorite_pressed = true;
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => detailPage()),
            );
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image(
              image: NetworkImage(document["images"][0]),
            ),
          ),
          title: Text(document["name"]),
          subtitle: Text(document["location"]),
          trailing: IconButton(
            icon:
                Icon(favorite_pressed ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
            iconSize: 25.0,
            onPressed: () {
              setState(() {
                favorite_pressed = !favorite_pressed;
              });
            },
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        shadowColor: kGreyColor,
        title: Text('list Page'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("cafes").snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                  children: makeListWidget(snapshot),
                );
            }
          },
        ),
      ),
    );
  }
}
