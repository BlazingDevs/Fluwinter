import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';

class listPage extends StatefulWidget {
  const listPage({Key? key}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  bool _favoriteButtonPressed = false;
  int idx = 0;
  FirebaseAuth user = FirebaseAuth.instance;
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
          trailing: FavoriteButton(
            iconSize: 25.0,
            isFavorite: false,
            valueChanged: (_isFavorite) {
              var list = [
                {"id": document["name"], "tag": document["tags"]}
              ];
              if (_isFavorite == false) {
                FirebaseFirestore.instance
                    .collection('user_data')
                    .doc(user.currentUser!.uid)
                    .set({"favorites": FieldValue.arrayRemove(list)}, SetOptions(merge: true));
              } else {
                FirebaseFirestore.instance
                    .collection('user_data')
                    .doc(user.currentUser!.uid)
                    .set({"favorites": FieldValue.arrayUnion(list)}, SetOptions(merge: true));
              }
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
