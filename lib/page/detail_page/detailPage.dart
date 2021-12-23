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
          icon: const Icon(Icons.bookmark_outline),
          onPressed: () {
            print('book mark button is pressed');
          },
        ),
        IconButton(
          icon: const Icon(Icons.location_pin),
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
          // 가게 대표 사진
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
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 가게 이름
                  const Text(
                    'CafeNamu',
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  // 태그
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kGreyColor),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '조용한',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kGreyColor),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '분위기 있는',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kGreyColor),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '커피가 맛있는',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'MENU',
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'REVIEW',
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
