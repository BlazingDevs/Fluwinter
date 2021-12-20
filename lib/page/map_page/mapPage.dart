import 'package:cafegation/constants/colors.dart';
import 'package:flutter/material.dart';

// map_page 시작
class mapPage extends StatefulWidget {
  const mapPage({Key? key}) : super(key: key);

  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: Text('Map Page'),
      ),
    );
  }
}
