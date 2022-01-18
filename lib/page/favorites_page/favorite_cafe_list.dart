import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:provider/provider.dart';
import 'package:cafegation/page/favorites_page/favorite_cafe_item.dart';

class FavoriteCafeList extends StatefulWidget {
  const FavoriteCafeList({ Key? key }) : super(key: key);

  @override
  _FavoriteCafeListState createState() => _FavoriteCafeListState();
}

class _FavoriteCafeListState extends State<FavoriteCafeList> {
  @override
  Widget build(BuildContext context) {
    final cafes = Provider.of<List<Cafe>>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Text('총 ${cafes.length}개'),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: cafes.length,
            itemBuilder: (context, index){
              return FavoriteCafeItem(cafe: cafes[index], index: index, hideFavorite: true,);
            },
          ),
        )
      ]
    );
  }
}