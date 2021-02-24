import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget{
  final movies;
  final item;

  Color mainColor = const Color(0xff3C3261);
  var imageUrl = 'https://image.tmdb.org/t/p/w500/';

  MovieItem(
      this.movies,
      this.item);

  @override
  Widget build(BuildContext context) {
    ///This item is horizontal so we will use the [Row Widget]
    ///Image at left and text at the right
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl + movies[item]['poster_path']),
                        fit: BoxFit.cover
                    ),
                    boxShadow: [
                      new BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 5.0)
                      )
                    ]
                ),
              ),
            ),
            ///Using Expanded so that all content will show
            ///This vertical so the Column will be used,
            ///putting it into a container widget enable giving it margin
            
          ],
        ),
        ///Divider
       
      ],
    );
  }
}