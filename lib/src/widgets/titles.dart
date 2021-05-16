import 'package:flutter/material.dart';

Widget titles(String texto, TextStyle estilos) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    alignment: Alignment.topLeft,
    child: Text(
      texto,
      style: estilos,
    ),
  );
}
