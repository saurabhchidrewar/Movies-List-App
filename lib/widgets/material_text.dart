// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MaterialText extends StatelessWidget {
  var movieList = [];
  int index = 0;
  Color textColor = Color.fromARGB(255, 6, 10, 89);
  String titleString = "";

  MaterialText(this.movieList, this.index, this.textColor, this.titleString);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Text(
        movieList[index][titleString],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: 15,
          fontFamily: 'QuickSand',
        ),
      ),
    );
  }
}
