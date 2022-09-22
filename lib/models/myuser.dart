import 'package:cafegation/services/database.dart';

class MyUser{
  final String uid;
  String? email;
  List<dynamic>? favorite;

  MyUser({this.uid = "", this.email}) {
    Future<List<dynamic>> fUser = DataBaseService().userFavorite(uid);
    fUser.then((value) => {favorite = value});
  }
  List<dynamic>? getUpdatedList() {
    Future<List<dynamic>> fUser = DataBaseService().userFavorite(uid);
    fUser.then((value) => {favorite = value});
    return favorite;
  }
}
