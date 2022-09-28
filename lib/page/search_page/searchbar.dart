import 'package:flutter/material.dart';
import 'package:cafegation/page/search_page/search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-1.0, 0.0),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(0, 3))
        ],
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      // child: TextField(
      //   decoration: InputDecoration(
      //     hintText: "카페 검색하기",
      //     border: InputBorder.none,
      //     icon: Icon(Icons.search),
      //     iconColor: Colors.black
      //   ),
      // ),
      // child: Scaffold(body: TabBarView(children: <Widget> [SearchScreen(),]))
      child: TextButton.icon(
        label: Text(
          '카페 검색하기',
          style: TextStyle(fontSize: 19),
        ),
        icon: Icon(Icons.search, size: 22),
        style: TextButton.styleFrom(
          primary: Colors.black54,
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}
