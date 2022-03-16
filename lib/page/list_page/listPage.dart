import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  bool _favoriteButtonPressed = false;

  DocumentReference _documentReference = FirebaseFirestore.instance
      .collection('user_data')
      .doc('hpRMlobAuTPg5lOjC3zTnJJCeHa2');
  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => detailPage(
                        cafeName: document["name"],
                      )),
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
            icon: Icon(_favoriteButtonPressed
                ? Icons.favorite
                : Icons.favorite_border),
            color: Colors.red,
            iconSize: 25.0,
            onPressed: () {
              //if문으로 favorite_pressed의 t/f여부를 보고 t면 f로, f면 t로 바꾸기
              //t였다면 userdata에서 삭제, f였다면 userdata에 추가
              setState(() {
                _favoriteButtonPressed = !_favoriteButtonPressed;
                _documentReference.set({
                  'favorites': document["name"]
                });
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
