import 'package:flutter/material.dart';

Widget titlesCategories(String texto, double size, Color color) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: 'PlayfairDisplay-bold',
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(1, 1),
            //blurRadius: 1,
          )
        ]),
  );
}
