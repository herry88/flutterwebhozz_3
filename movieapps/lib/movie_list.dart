import 'package:flutter/material.dart';

///For making calls to an api
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'movieItem.dart';
// import 'movie_details.dart';

class MovieList extends StatefulWidget{
  MyMovieListState createState() => new MyMovieListState();
}

class MyMovieListState extends State<MovieList>{
  var movies; //Movie will hold data gotten from the API in it and will further be used to populate the UI
  Color mainColor = const Color(0xff3C3261);

  //Get the response and use the response to update the UI
  void getData() async{
    var data = await getJson();
    //Use this to update the App state
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Movies",
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold
          )),
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white70,
        /*leading: new Icon(
          Icons.arrow_back,
          color: mainColor
        ),*/
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
                children: <Widget>[
                  new Icon(
                      Icons.refresh,
                      color: mainColor,
                  )
                ],
            )
          )
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           //clasd movie title
           MovieTitle(),
            new Expanded(
                child: new ListView.builder(
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i){
                      return new FlatButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context){
                            //     return MovieDetails(movies[i]);
                            //   })
                            // );
                          },
                          child: new MovieItem(movies, i),
                          color: Colors.white,
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}



Future<Map> getJson() async{
  var url = "http://api.themoviedb.org/3/discover/movie?api_key=6a5b06b76d2c628e345f4730e4473751";
  http.Response response = await http.get(url);

  print(json.decode(response.body));
  return json.decode(response.body);
}