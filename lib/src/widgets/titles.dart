import 'package:flutter/material.dart';

Widget titles(String texto, double size, Color color) {
  return Container(
    child: Text(
      texto,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w600,
        color: color,
        fontSize: size,
      ),
    ),
  );
}
