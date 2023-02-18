// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  var movieList = [];
  int movieId = 0;

  MovieDetails(this.movieList, this.movieId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 10, 89),
        title: Text(
          "Details",
          style: TextStyle(
            fontFamily: 'QuickSand',
            letterSpacing: 6,
            wordSpacing: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Material(
        type: MaterialType.transparency,
        child: Hero(
          tag: 'showdetails$movieId',
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).padding.top),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color.fromARGB(255, 6, 10, 89)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        movieList[movieId]['original_title'],
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontFamily: 'QuickSand',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${movieList[movieId]['poster_path']}',
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      movieList[movieId]['overview'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.0132,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).padding.top * 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            movieList[movieId]['release_date'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.013,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            '${movieList[movieId]['vote_average'].toString()} ⭐',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.013,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            '${movieList[movieId]['vote_count'].toString()} Reviews',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.013,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
