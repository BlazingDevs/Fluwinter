import 'package:cafegation/services/database.dart';

class MyUser{
  final String uid;
  String? email;
  List<String>? favorite;

  MyUser({ this.uid = "", this.email }){
    Future<List<String>> fUser = DataBaseService().userFavorite(uid);
    fUser.then((value) => favorite);
  }
}