import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafegation/models/cafe.dart';

class DataBaseService {
  
  //쓰기를 할때 firebase가 발급한 UID를 이용하도록 함.
  String uid = '';

  DataBaseService();
  DataBaseService.withUID({ required this.uid });

  //카페 콜렉션
  final CollectionReference cafeCollection = FirebaseFirestore.instance.collection('cafes');

  //카페 정보를 업데이트함. (create는 필요 없음. 없으면 firebase에서 만듦.)
  Future updateCafeData(String uid, String name, String telephone, String location, double rating) async {
    if(uid.isEmpty) throw NullThrownError();
    return await cafeCollection.doc(uid).set({
      'name': name,
      'telephone': telephone,
      'location': location,
      'rating': rating
    });
  }

  List<Cafe> _cafeListFromSnapShot(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((doc){
      return Cafe(
        name: doc['name'],
        telephone: doc['telephone'],
        location: doc['location'],
        rating: doc['rating'],
        images: List.from( doc['images'] )
      );
    }).toList();
  }

  // 카페 스트림을 가져옴
  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots()
      .map(_cafeListFromSnapShot);
  }

}