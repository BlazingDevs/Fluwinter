// import 'package:cafegation/constants/colors.dart';
import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(Icons.bookmark_outline),
              onPressed: () {
                print('book mark button is pressed');
              },
            ),
            IconButton(
              icon: Icon(Icons.location_pin),
              onPressed: () {
                print('location_pin button is pressed');
              },
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/sample_image.jpg'),
            ),
          ),
        ));
  }
}
