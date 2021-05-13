import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget titles(String texto) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    alignment: Alignment.topLeft,
    child: Text(
      texto,
      style: titlesStyle,
    ),
  );
}
