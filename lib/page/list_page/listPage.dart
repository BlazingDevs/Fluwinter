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
    return FutureProvider<List<Cafe>>.value(
        value: DataBaseService().cafeListFromSnapShot(widget.tagCode),
        initialData: [],
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[200],
              shadowColor: kGreyColor,
              title: Text('list Page'),
            ),
            body: CafeList()));
  }
}
