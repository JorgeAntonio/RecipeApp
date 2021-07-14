import 'package:flutter/material.dart';

Widget titles(String texto, double size, Color color) {
  return Container(
    child: Text(
      texto,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(0.5, 0.5),
          )
        ],
      ),
    ),
  );
}
