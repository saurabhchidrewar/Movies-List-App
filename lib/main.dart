// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Movie List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var allMovies = [];
var latestMovies = [];
var popularMovies = [];

class _MyHomePageState extends State<MyHomePage> {
  void getMovies() async {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=909594533c98883408adef5d56143539&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate');
    // print(response.data['results']);
    allMovies = response.data['results'];

    latestMovies = List.from(allMovies);
    latestMovies.sort((b, a) => a['release_date'].compareTo(b['release_date']));

    popularMovies = List.from(allMovies);
    popularMovies.sort((b, a) => a['popularity'].compareTo(b['popularity']));
  }

  Widget menu() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Latest",
            icon: Icon(Icons.access_alarm_outlined),
          ),
          Tab(
            text: "Popular",
            icon: Icon(Icons.adjust_sharp),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getMovies();
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3F5AA6),
            title: Text(
              "Movies List",
              style: TextStyle(
                fontFamily: 'QuickSand',
                letterSpacing: 6,
                wordSpacing: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(
                child: latestMovies.isNotEmpty
                    ? ListView.builder(
                        itemCount: latestMovies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              padding: EdgeInsets.only(left: 10),
                              color: Color.fromARGB(255, 94, 120, 191),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                        latestMovies[index]['original_title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow.shade200,
                                          fontFamily: 'QuickSand',
                                        )),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    child: Text(
                                      latestMovies[index]['release_date'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'QuickSand',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      '${latestMovies[index]['popularity'].toStringAsFixed(0)} ⭐',
                                      style: TextStyle(
                                        color: Colors.red.shade100,
                                        fontFamily: 'QuickSand',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500/${latestMovies[index]['poster_path']}',
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
              ),
              Container(
                child: popularMovies.isNotEmpty
                    ? ListView.builder(
                        itemCount: popularMovies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              padding: EdgeInsets.only(left: 10),
                              // color: Colors.blue.shade200,
                              color: Color.fromARGB(255, 94, 120, 191),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      popularMovies[index]['original_title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'QuickSand',
                                        color: Colors.yellow.shade200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                    child: Text(
                                      popularMovies[index]['release_date'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'QuickSand',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      '${popularMovies[index]['popularity'].toStringAsFixed(0)} ⭐',
                                      style: TextStyle(
                                        color: Colors.red.shade100,
                                        fontFamily: 'QuickSand',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500/${popularMovies[index]['poster_path']}',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// hero