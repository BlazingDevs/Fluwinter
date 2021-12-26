import 'package:flutter/material.dart';
import 'package:cafegation/models/cafe.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class FavoriteCafeItem extends StatelessWidget {
  final Cafe cafe;

  const FavoriteCafeItem({ required this.cafe, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[200],
      height: 100,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 60,
            child: ImageIcon(
              const AssetImage('assets/heart.png'),
              color: Colors.red[500],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, 
              image: cafe.images[0]
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(cafe.name,
                style: const TextStyle( 
                  fontSize: 20, 
                ),
                ),
                Text(cafe.location,
                style: TextStyle( 
                  fontSize: 15,
                  color: Colors.grey[500]
                ),
                ),
                Row(children: [
                  Text('${cafe.rating}'),
                  RatingBarIndicator(
                    rating: cafe.rating,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  )
                ],)
              ],
            ),
          )
        ],
      ),
    ); 
  }
}