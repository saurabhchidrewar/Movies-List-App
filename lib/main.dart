// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './widgets/showmovies.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  void getMovies() async {
    var response = await Dio().get(
        'https://api.themoviedb.org/3/discover/movie?api_key=909594533c98883408adef5d56143539&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate');
    // print(response.data['results']);
    allMovies = response.data['results'];
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
              showMovies(allMovies, 'Latest'),
              showMovies(allMovies, 'Popular'),
            ],
          ),
        ),
      ),
    );
  }
}
// hero