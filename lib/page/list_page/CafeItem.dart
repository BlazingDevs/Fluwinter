import 'package:cafegation/models/myuser.dart';
import 'package:cafegation/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:cafegation/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CafeItem extends StatefulWidget {
  final Cafe cafe;
  const CafeItem({required this.cafe, Key? key}) : super(key: key);

  @override
  State<CafeItem> createState() => _CafeItemState();
}

class _CafeItemState extends State<CafeItem> {
  @override
  bool state = false;
  var lst = [];
  Widget build(BuildContext context) {
    final a = listMaker();
    a.then((value) {
      setState(() {
        if (value.contains(widget.cafe.id)) {
          state = true;
        } else {
          state = false;
        }
      });
    });
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailPage(
                      cafeName: widget.cafe.id,
                      likedStatus: state,
                    )),
          );
        },
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.cafe.images,
              width: 80,
              height: 100,
            )),
        title: Text(widget.cafe.name),
        subtitle: Text(widget.cafe.location),
        trailing: IconButton(
          icon: Icon(state == true ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          iconSize: 25.0,
          onPressed: () {
            setState(() {
              var list = [
                {"id": widget.cafe.id, "tag": widget.cafe.tags}
              ];
              if (state == true) {
                state = false;
                FirebaseFirestore.instance
                    .collection('user_data')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({"favorites": FieldValue.arrayRemove(list)}, SetOptions(merge: true));
                Icon(Icons.favorite_border);
              } else {
                state = true;
                FirebaseFirestore.instance
                    .collection('user_data')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({"favorites": FieldValue.arrayUnion(list)}, SetOptions(merge: true));
                Icon(Icons.favorite);
              }
              stateBool(AuthService().user!, state);
            });
          },
        ));
  }

  Future<bool> stateBool(MyUser user, bool state) {
    final a = listMaker();
    return a.then((value) {
      if (value.contains(widget.cafe.id)) {
        state = true;
      } else {
        state = false;
      }
      return state;
    });
  }

  Future<List<dynamic>> listMaker() {
    FirebaseAuth user = FirebaseAuth.instance;
    var b;

    final a = FirebaseFirestore.instance.collection('user_data').doc(user.currentUser!.uid);
    return a.get().then((value) {
      b = value.data();
      b = b['favorites'];
      lst = [];
      for (var d in b) {
        d = d['id'];
        lst.add(d.toString());
      }
      return lst;
    });
  }
}
