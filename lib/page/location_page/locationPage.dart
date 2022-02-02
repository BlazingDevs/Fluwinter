import 'package:cafegation/constants/colors.dart';
import 'package:flutter/material.dart';

class locationPage extends StatefulWidget {
  const locationPage({Key? key}) : super(key: key);

  @override
  _locationPageState createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: kGreyColor,
        title: const Text('location Page'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_location),
              onPressed: () {
                print("location button is pressed");
              })
        ],
      ),
    );
  }
}
