import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class locationPage extends StatefulWidget {
  const locationPage({Key? key}) : super(key: key);

  @override
  _locationPageState createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.black,
      title: const Text('location Page'),
      actions: [
        IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: () {
              print("location button is pressed");
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(),
    );
  }
}
