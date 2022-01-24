import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/location_page/locationPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key, required this.cafeName}) : super(key: key);

  final String cafeName;

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  bool _favoriteButtonPressed = false;

  String _images = "대표 사진";
  String _name = "카페 이름";
  String _location = "장소";

  PreferredSizeWidget _appBarWidget() {
    DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('cafes').doc(widget.cafeName);

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Image.asset(
            _favoriteButtonPressed
                ? 'assets/heart.png'
                : 'assets/heart_border.png',
            color: Colors.red[500],
          ),
          onPressed: () {
            setState(() {
              _favoriteButtonPressed = !_favoriteButtonPressed;
              _documentReference.update({'favorite': _favoriteButtonPressed});
            });
            ;
          },
        ),
        IconButton(
          icon: const Icon(Icons.location_pin),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const locationPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    var size = MediaQuery.of(context).size;

    DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('cafes').doc(widget.cafeName);

    return StreamBuilder(
      stream: _documentReference.snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        _images = snapshot.data!['images'][0];
        _name = snapshot.data!['name'];
        _location = snapshot.data!['location'];

        return SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              // 가게 대표 사진
              Container(
                width: double.infinity,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_images), fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.45),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 카페 이름
                      Text(
                        _name,
                        style: const TextStyle(
                          fontSize: 30,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // 카페 위치
                      Text(
                        _location,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
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
                        height: 15,
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
                        height: 5,
                      ),
                      // 메뉴판
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kGreyColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '- 아메리카노\n- 카페 라떼\n- 바닐라 라뗴\n- 핫초코',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'REVIEW',
                        style: TextStyle(
                          height: 1.6,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // 리뷰
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kGreyColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            '- 여기 불친절해요\n- 커피 맛집',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
