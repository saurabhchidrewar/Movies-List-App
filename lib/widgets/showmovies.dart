// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

class showMovies extends StatelessWidget {
  var movieList = [];
  String category;

  showMovies(this.movieList, this.category);

  @override
  Widget build(BuildContext context) {
    if (category == 'Latest') {
      movieList.sort((b, a) => a['release_date'].compareTo(b['release_date']));
    } else {
      movieList.sort((b, a) => a['popularity'].compareTo(b['popularity']));
    }

    return Container(
      child: movieList.isNotEmpty
          ? ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Color.fromARGB(255, 94, 120, 191),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(movieList[index]['original_title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade200,
                                fontFamily: 'QuickSand',
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: Text(
                            movieList[index]['release_date'],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.17,
                          child: Text(
                            '${movieList[index]['popularity'].toStringAsFixed(0)} ⭐',
                            style: TextStyle(
                              color: Colors.red.shade100,
                              fontFamily: 'QuickSand',
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movieList[index]['poster_path']}',
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('No items'),
            ),
    );
  }
}
