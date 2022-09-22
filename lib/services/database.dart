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
  final CollectionReference cafeCollection = FirebaseFirestore.instance.collection('cae');
  final CollectionReference userDataCollection = FirebaseFirestore.instance.collection('user_data');

  //카페 정보를 업데이트함. (create는 필요 없음. 없으면 firebase에서 만듦.)
  Future updateUserData(String uid, List<String> favorite) async {
    if (uid.isEmpty) throw NullThrownError();
    return await cafeCollection.doc(uid).set({'favorite': favorite});
  }

  Future updateCafeData(String uid, String name, String telephone, String location, double rating) async {
    if (uid.isEmpty) throw NullThrownError();
    return await cafeCollection.doc(uid).set({'name': name, 'telephone': telephone, 'location': location, 'rating': rating});
  }

  List<String> nonNullableList(DocumentSnapshot doc, String name) {
    try {
      return List.from(doc[name]);
    } catch (e) {
      return const [];
    }
  }

  List<int> nonNullableListfromInt(DocumentSnapshot doc, String name) {
    try {
      return List.from(doc[name]);
    } catch (e) {
      return const [];
    }
  }

  Cafe cafeBuilder(DocumentSnapshot doc) {
    return Cafe(
      id: doc.id,
      name: doc['name'],
      telephone: doc['telephone'],
      location: doc['location'],
      rating: doc['rating'],
      images: doc['images'],
      reviews: nonNullableList(doc, 'reviews'),
      menus: nonNullableList(doc, 'menus'),
      tags: nonNullableListfromInt(doc, 'tags'),
    );
  }

  Future<List<Cafe>> cafeListFromSnapShot(int i) async {
    List<Cafe> lst = [];
    String docName = 'bakery_cafe';
    if (i == 1) {
      docName = 'bakery_cafe';
    } else if (i == 2) {
      docName = 'brunch_cafe';
    } else if (i == 3) {
      docName = 'healing_cafe';
    } else if (i == 4) {
      docName = 'instagram_cafe';
    } else if (i == 5) {
      docName = 'new_cafe';
    } else if (i == 6) {
      docName = 'view_cafe';
    }

    DocumentSnapshot<Map<String, dynamic>> a = await FirebaseFirestore.instance.collection('tags').doc(docName).get();
    var document = await cafeCollection.get();
    for (var cafe_name in a.data()!.values) {
      for (QueryDocumentSnapshot doc in document.docs) {
        if (doc['name'] == cafe_name) {
          lst.add(cafeBuilder(doc));
          break;
        }
      }
    }
    //for (String cafe_id in ab) {}
    return lst;
    //중첩이문제인듯.
  }

  Future<List<Cafe>> favoriteCafes(MyUser user) async {
    if (user.favorite == null) return [];
    List<Cafe> favoriteCafes = [];
    for (String cafe_id in user.getUpdatedList()!) {
      var document = await cafeCollection.doc(cafe_id).get();
      favoriteCafes.add(cafeBuilder(document));
    }
    return favoriteCafes;
  }

  // 카페 스트림을 가져옴
  // Stream<List<Cafe>> get cafes {
  //   return cafeCollection.snapshots().map(_cafeListFromSnapShot);
  // }

  Future<List<dynamic>> userFavorite(String uid) async {
    FirebaseAuth user = FirebaseAuth.instance;
    var b;
    List<dynamic> lst = [];
    DocumentReference a = FirebaseFirestore.instance.collection('user_data').doc(user.currentUser!.uid);
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
