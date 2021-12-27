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
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: kGreyColor,
        title: Text('Map Page'),
        actions: [
          IconButton(
              icon: Icon(Icons.add_location),
              onPressed: () {
                print("location button is pressed");
              })
        ],
      ),
    );
  }
}
