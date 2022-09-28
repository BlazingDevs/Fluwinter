import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/detail_page/detailMapPage.dart';
import 'package:cafegation/page/location_page/locationPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:firebase_auth/firebase_auth.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key, required this.cafeName}) : super(key: key);

  final String cafeName;
  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  Widget _tagWidget(int tag) {
    String tagString = "태그";

    switch (tag) {
      case 1:
        tagString = "디저트";
        break;
      case 2:
        tagString = "브런치";
        break;
      case 3:
        tagString = "힐링되는";
        break;
      case 4:
        tagString = "인스타 갬성,,";
        break;
      case 5:
        tagString = "새로 생긴";
        break;
      case 6:
        tagString = "뷰가 좋은";
        break;
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kGreyColor),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          tagString,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    var size = MediaQuery.of(context).size;

    DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('cae').doc(widget.cafeName);

    return StreamBuilder(
      stream: _documentReference.snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        String _images = snapshot.data!['images'];
        String _name = snapshot.data!['name'];
        String _location = snapshot.data!['location'];
        List<dynamic> _tags = snapshot.data!['tags'];
        Map<String, dynamic> _menus = snapshot.data!['menus'];
        List<dynamic> _reviews = snapshot.data!['reviews'];

        var menus = _menus.keys;

        String getLineBreakStrings(Iterable<String> keys) {
          StringBuffer sb = StringBuffer();
          var count = 0;

          for (String key in keys) {
            if (count >= 8) break;
            count++;
            sb.write("- ${key} : ${_menus[key]}\n");
          }
          return sb.toString();
        }

        String getReviewList(List<dynamic> _reviews) {
          StringBuffer sb = StringBuffer();
          for (String review in _reviews) {
            sb.write("- ${review}\n");
          }
          return sb.toString();
        }

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
                margin: EdgeInsets.only(top: size.height * 0.35),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
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
                        " ${_location}",
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      // 태그
                      Wrap(
                        spacing: 10,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width),
                          for (int tag in _tags) _tagWidget(tag)
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
                        padding: const EdgeInsets.all(7.0),
                        child: Text(getLineBreakStrings(menus)),
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
                        child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(getReviewList(_reviews))),
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
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cae')
                    .doc(widget.cafeName)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Something went wrong');
                  }

                  return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('user_data')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, userSnapshot) {
                      if (!userSnapshot.hasData) {
                        return const Text('Something went wrong');
                      }
                      bool _favoriteButtonPressed = false;

                      var b = userSnapshot.data!['favorites'];
                      var list = [];

                      for (var d in b) {
                        d = d['id'];
                        list.add(d.toString());
                      }

                      if (list.contains(widget.cafeName)) {
                        _favoriteButtonPressed = true;
                      } else {
                        _favoriteButtonPressed = false;
                      }

                      double _xcoordinate = snapshot.data!['coordinate'][0];
                      double _ycoordinate = snapshot.data!['coordinate'][1];

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
                            icon: Icon(
                              _favoriteButtonPressed
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                            color: Colors.red,
                            iconSize: 25.0,
                            onPressed: () {
                              setState(() {
                                _favoriteButtonPressed =
                                    !_favoriteButtonPressed;

                                var list = [
                                  {
                                    "id": widget.cafeName,
                                    "tag": snapshot.data!['tags'],
                                  }
                                ];

                                if (_favoriteButtonPressed == true) {
                                  FirebaseFirestore.instance
                                      .collection('user_data')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .set({
                                    "favorites": FieldValue.arrayUnion(list)
                                  }, SetOptions(merge: true));
                                } else {
                                  FirebaseFirestore.instance
                                      .collection('user_data')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .set({
                                    "favorites": FieldValue.arrayRemove(list)
                                  }, SetOptions(merge: true));
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.location_pin),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => detailMapPage(
                                        xcoordinate: _xcoordinate,
                                        ycoordinate: _ycoordinate,
                                      )));
                            },
                          ),
                        ],
                      );
                    },
                  );
                })),
        body: _bodyWidget());
  }
}
