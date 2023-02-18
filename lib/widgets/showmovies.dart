// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movieapp/widgets/material_text.dart';
import 'package:movieapp/widgets/moviedetails.dart';

class showMovies extends StatelessWidget {
  var movieList = [];
  String category;

  showMovies(this.movieList, this.category);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    timeDilation = 2.0;

    if (category == 'Latest') {
      movieList.sort((b, a) => a['release_date'].compareTo(b['release_date']));
    } else {
      movieList.sort((b, a) => a['popularity'].compareTo(b['popularity']));
    }

    return Material(
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 43, 48, 145)),
        child: movieList.isNotEmpty
            ? ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetails(movieList, index)));
                      },
                      child: Hero(
                        tag: 'showdetails$index',
                        child: Container(
                          height: mediaQuery.size.height * 0.15,
                          color: Color.fromARGB(255, 94, 120, 191),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: mediaQuery.size.width * 0.3,
                                  child: MaterialText(
                                    movieList,
                                    index,
                                    Colors.yellow.shade600,
                                    'original_title',
                                  ),
                                ),
                                Container(
                                  width: mediaQuery.size.width * 0.20,
                                  child: MaterialText(
                                    movieList,
                                    index,
                                    Color.fromARGB(255, 6, 10, 89),
                                    'release_date',
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.17,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      '${movieList[index]['popularity'].toStringAsFixed(0)} ⭐',
                                      style: TextStyle(
                                        color: Colors.red.shade100,
                                        fontFamily: 'QuickSand',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaQuery.size.width * 0.3,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${movieList[index]['poster_path']}',
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  'No items',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
