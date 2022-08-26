import 'package:cafegation/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:cafegation/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CafeItem extends StatelessWidget {
  final Cafe cafe;

  CafeItem({required this.cafe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailPage(
                      cafeName: cafe.name,
                    )),
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image(
            image: NetworkImage(cafe.images, scale: 3.0),
          ),
        ),
        title: Text(cafe.name),
        subtitle: Text(cafe.location),
        trailing: IconButton(
          icon: Icon(listmaker() == true ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          iconSize: 25.0,
          onPressed: () {
            var list = [
              {"id": cafe.id, "tag": cafe.tags}
            ];
            if (state == false) {
              FirebaseFirestore.instance
                  .collection('user_data')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({"favorites": FieldValue.arrayUnion(list)}, SetOptions(merge: true));
            } else {
              FirebaseFirestore.instance
                  .collection('user_data')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({"favorites": FieldValue.arrayRemove(list)}, SetOptions(merge: true));
            }
          },
        ));
  }

  bool state = false;
  Future<bool> listmaker() async {
    // if (DataBaseService().userFavorite(AuthService().user!.uid) == cafe.id) {
    //   state = true;
    // }
    return state;
  }
}
