import 'package:flutter/material.dart';
import 'package:cafegation/constants/colors.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({ Key? key }) : super(key: key);

  @override
  _favoritesPageState createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: Text('Favorites Page'),
        ),
    );
  }
}