import 'package:flutter/material.dart';
import 'package:cafegation/page/search_page/search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
      child: IconButton(
        icon: Icon(
          Icons.search,
          size: 20,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}
