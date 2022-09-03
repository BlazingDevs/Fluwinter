import 'package:cafegation/models/myuser.dart';
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
  bool state = false;
  List lst = [];
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailPage(
                      cafeName: cafe.id,
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
          icon: Icon(stateBool(AuthService().user!) == true ? Icons.favorite : Icons.favorite_border),
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
              state = true;
            } else {
              FirebaseFirestore.instance
                  .collection('user_data')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({"favorites": FieldValue.arrayRemove(list)}, SetOptions(merge: true));
              state = false;
            }
          },
        ));
  }

  Future<bool> stateBool(MyUser user) {
    final a = listMaker();
    return a.then((value) {
      print(value);
      if (value.contains(cafe.id)) {
        print('true');
        state = true;
      } else {
        state = false;
      }
      return state;
    });

    // print('next123');
    // print(state);
    // return state;

    // a.get().then(
    //   (value) {
    //     temp = value.data();
    //     temp = temp['favorites'];
    //     for (var d in temp) {
    //       d = d['id'];
    //       print(d);
    //       if (d == cafe.id) {
    //         state = true;
    //         print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    //         return state;
    //       } else {
    //         print("doesn't fit");
    //       }
    //     }
    //   },
    // );
    // if (DataBaseService().userFavorite(AuthService().user!.uid) == cafe.id) {
    //   state = true;
    // }
    //final dbcall = await DataBaseService().userFavorite(AuthService().user!.toString());
    // final db = FirebaseFirestore.instance.collection('user_data').doc(AuthService().user!.toString()).get().then((value) {
    //   final data = value.data() as Map<String, dynamic>;
    //   print(data.values.first);
    //   print('123');
    //   // a.add(value);
    // });

    // var db = await FirebaseFirestore.instance.collection('user_data').doc(AuthService().user!.toString()).get();
    // print(db.data());
    // print('object');
    // print(state);
    // print('listMaker function working');
    // for (String a in dbcall) {
    //   print('321321');
    //   print(a);
    //   print(cafe.id);
    //   print('printed');
    //   if (a == cafe.id) {
    //     state = true;
    //     break;
    //   }
    // }

    // return docs.get().then((DocumentSnapshot doc) {
    //   final data = doc.data() as Map<String, dynamic>;
    //   print(data.values.first);
    //   print('clear');
    //   return state;
    // });
    // print(state);
    // print(33);
  }

  Future<List<dynamic>> listMaker() {
    FirebaseAuth user = FirebaseAuth.instance;
    var b;
    final a = FirebaseFirestore.instance.collection('user_data').doc(user.currentUser!.uid);
    return a.get().then((value) {
      b = value.data();
      b = b['favorites'];
      for (var d in b) {
        d = d['id'];
        lst.add(d.toString());
      }
      return lst;
    });
    // print('next');
    // print(lst);
    // for (String t in lst) {
    //   print(t);
    // }
    // return c;
  }
}


//TODO: listMaker랑 userFavorite을 https://firebase.google.com/docs/firestore/query-data/get-data?hl=ko#get_a_document에 기반하여 수정하기 => done

//TODO: _castError {type 'Null' is not a subtype of type 'Map<String, dynamic>' in type cast} 해결하기