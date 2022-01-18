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
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => detailPage()),
          );
        },
        title: Text(document["name"]),
        subtitle: Text(document["location"]),
      );
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
