import 'package:cafegation/models/myuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseService {
  //쓰기를 할때 firebase가 발급한 UID를 이용하도록 함.
  static final DataBaseService instance = DataBaseService._internal();

  factory DataBaseService() {
    return instance;
  }
  DataBaseService._internal();

  //카페 콜렉션
  final CollectionReference cafeCollection =
      FirebaseFirestore.instance.collection('cafes');
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('user_data');

  //카페 정보를 업데이트함. (create는 필요 없음. 없으면 firebase에서 만듦.)
  Future updateUserData(String uid, List<String> favorite) async {
    if (uid.isEmpty) throw NullThrownError();
    return await cafeCollection.doc(uid).set({'favorite': favorite});
  }

  Future updateCafeData(String uid, String name, String telephone,
      String location, double rating) async {
    if (uid.isEmpty) throw NullThrownError();
    return await cafeCollection.doc(uid).set({
      'name': name,
      'telephone': telephone,
      'location': location,
      'rating': rating
    });
  }

  List<String> nonNullableList(DocumentSnapshot doc, String name) {
    try {
      return List.from(doc[name]);
    } catch (e) {
      return const [];
    }
  }

  Cafe cafeBuilder(DocumentSnapshot doc) {
    return Cafe(
      name: doc['name'],
      telephone: doc['telephone'],
      location: doc['location'],
      rating: doc['rating'],
      images: nonNullableList(doc, 'images'),
      reviews: nonNullableList(doc, 'reviews'),
      menus: nonNullableList(doc, 'menus'),
      tags: nonNullableList(doc, 'tags'),
    );
  }

  List<Cafe> _cafeListFromSnapShot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      return cafeBuilder(doc);
    }).toList();
  }

  Future<List<Cafe>> favoriteCafes(MyUser user) async {
    if (user.favorite == null) return [];
    List<Cafe> favoriteCafes = [];
    for (String cafe_id in user.favorite!) {
      var document = await cafeCollection.doc(cafe_id).get();
      favoriteCafes.add(cafeBuilder(document));
    }
    return favoriteCafes;
  }

  // 카페 스트림을 가져옴
  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_cafeListFromSnapShot);
  }

  Future<List<dynamic>> userFavorite(String uid) async {
    FirebaseAuth user = FirebaseAuth.instance;
    var b;
    List<dynamic> lst = [];
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
