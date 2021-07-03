import 'package:flutter/material.dart';

Widget titles(String texto, double size, Color color) {
  return Container(
    //padding: EdgeInsets.all(8),
    child: Text(
      texto,
      style: TextStyle(
        fontFamily: 'PlayfairDisplay-bold',
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(0.5, 0.5),
            //blurRadius: 1,
          )
        ],
      ),
    ),
  );
}
