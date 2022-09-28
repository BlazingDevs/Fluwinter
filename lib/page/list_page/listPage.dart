import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/list_page/CafeList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:provider/provider.dart';
import 'package:cafegation/services/auth.dart';
import 'package:cafegation/services/database.dart';

class listPage extends StatefulWidget {
  final tagCode;
  const listPage({Key? key, required this.tagCode}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    String tagName = '';
    if (widget.tagCode == 1) {
      tagName = '디저트';
    } else if (widget.tagCode == 2) {
      tagName = '브런치';
    } else if (widget.tagCode == 3) {
      tagName = '힐링 되는';
    } else if (widget.tagCode == 4) {
      tagName = '인스타 갬성,,';
    } else if (widget.tagCode == 5) {
      tagName = '새로 생긴';
    } else if (widget.tagCode == 6) {
      tagName = '뷰가 좋은';
    }
    return FutureProvider<List<Cafe>>.value(
        value: DataBaseService().cafeListFromSnapShot(widget.tagCode),
        initialData: [],
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[200],
              shadowColor: kGreyColor,
              title: Text(tagName),
            ),
            body: CafeList()));
  }
}
