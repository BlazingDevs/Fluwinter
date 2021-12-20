import 'package:cafegation/constants/colors.dart';
import 'package:flutter/material.dart';
class detailPage extends StatefulWidget {
  const detailPage({ Key? key }) : super(key: key);

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: Text('detail Page'),
        ),
    );
  }
}