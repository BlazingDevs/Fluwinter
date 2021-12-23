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
                    style: TextStyle(fontSize: 30, height: 1.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // 태그
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('조용한'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('분위기 있는'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('커피가 맛있는'),
                        ),
                      ),
                    ],
                  )
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
