import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class FavoriteCafeItem extends StatefulWidget {
  final Cafe cafe;
  final bool hideFavorite;
  final int index;
  const FavoriteCafeItem({Key? key, required this.hideFavorite, required this.cafe, required this.index}) : super(key: key);

  @override
  State<FavoriteCafeItem> createState() => _FavoriteCafeItemState();
}

class _FavoriteCafeItemState extends State<FavoriteCafeItem> {
  @override
  bool state = true;
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => detailPage(
                    cafeName: widget.cafe.id,
                    likedStatus: true,
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
        icon: Icon(state ? Icons.favorite : Icons.favorite_border),
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
            } else {
              state = true;
              FirebaseFirestore.instance
                  .collection('user_data')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({"favorites": FieldValue.arrayUnion(list)}, SetOptions(merge: true));
            }
          });
        },
      ),
    );
  }
}
