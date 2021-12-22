import 'package:cafegation/constants/colors.dart';
import 'package:flutter/material.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key}) : super(key: key);

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  PreferredSizeWidget _appBarWidget() {
    return AppBar(
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
    );
  }

  Widget _bodyWidget() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sample_image.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          child: Container(
                        width: 150,
                        height: 7,
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: BorderRadius.circular(10)),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'CafeNamu',
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ])),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBarWidget(),
        body: _bodyWidget());
  }
}
