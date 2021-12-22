import 'package:flutter/material.dart';
import 'package:cafegation/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class favoritesPage extends StatefulWidget {
  const favoritesPage({ Key? key }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<favoritesPage> {
  List<int> bottomList = <int>[0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        shadowColor: kGreyColor,
        title: const Text('Favorites Page'),
        ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200 + index % 4 * 100],
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: SizedBox(
                          width: 60,
                          child: ImageIcon(
                            const AssetImage('assets/heart.png'),
                            color: Colors.red[500],
                            ),
                        ),
                        onTap: () {
                          //TODO: actual maker disable/enable from DB is needed
                          //bottomList.removeAt(index);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage, 
                          image: 'https://picsum.photos/250?image=9'
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('My Favorite : Name',
                            style: TextStyle( 
                              fontSize: 20, 
                            ),
                            ),
                            Text('주소 ~~~~~~~~~~~',
                            style: TextStyle( 
                              fontSize: 15,
                              color: Colors.grey[500]
                            ),
                            ),
                            RatingBarIndicator(
                              rating: 3,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20.0,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: bottomList.length
            )
          )
        ],
      )
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}