import 'package:flutter/material.dart';
import 'package:cafegation/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:cafegation/services/database.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:cafegation/page/favorites_page/favorite_cafe_list.dart';


class favoritesPage extends StatefulWidget {
  const favoritesPage({ Key? key }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<favoritesPage> {
  List<int> bottomList = <int>[0];

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cafe>>.value(
      initialData: const [],
      value: DataBaseService().cafes,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          shadowColor: kGreyColor,
          title: const Text('Favorites Page'),
          ),
        body: FavoriteCafeList()
      ),
    );
  }
}

