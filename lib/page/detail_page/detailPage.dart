import 'package:cafegation/constants/colors.dart';
import 'package:cafegation/page/location_page/locationPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafegation/models/cafe.dart';

class detailPage extends StatefulWidget {
  const detailPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  bool _favoriteButtonPressed = false;

  PreferredSizeWidget _appBarWidget() {
    DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('cae').doc(widget.id);

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

  Widget _tagWidget(int tag) {
    String tag_string = "태그";

    switch (tag) {
      case 1:
        tag_string = "bakery_cafe";
        break;
      case 2:
        tag_string = "brunch_cafe";
        break;
      case 3:
        tag_string = "healing_cafe";
        break;
      case 4:
        tag_string = "instagram_cafe";
        break;
      case 5:
        tag_string = "new_cafe";
        break;
      case 6:
        tag_string = "view_cafe";
        break;
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: kGreyColor),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          tag_string,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    var size = MediaQuery.of(context).size;

    DocumentReference _documentReference =
        FirebaseFirestore.instance.collection('cae').doc(widget.id);

    return StreamBuilder(
      stream: _documentReference.snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        String _images = snapshot.data!['images'];
        String _name = snapshot.data!['name'];
        String _location = snapshot.data!['location'];
        List<dynamic> _tags = snapshot.data!['tags'];
        Map<String, dynamic> _menus = snapshot.data!['menus'];

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
                        children: [for (int tag in _tags) _tagWidget(tag)],
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
                        padding: EdgeInsets.all(7.0),
                        child: Row(
                          children: [
                            for (String menu in _menus.keys)
                              Text(
                                "- ${menu} \n",
                                style: TextStyle(fontSize: 13),
                              ),
                          ],
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
