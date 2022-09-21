import 'package:cafegation/page/list_page/CafeItem.dart';
import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:provider/provider.dart';

class CafeList extends StatefulWidget {
  const CafeList({Key? key}) : super(key: key);

  @override
  _CafeListState createState() => _CafeListState();
}

class _CafeListState extends State<CafeList> {
  @override
  Widget build(BuildContext context) {
    final cafes = Provider.of<List<Cafe>>(context);
    return ListView.builder(
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        return CafeItem(cafe: cafes[index]);
      },
    );
  }
}
