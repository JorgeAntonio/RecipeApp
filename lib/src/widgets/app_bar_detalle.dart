import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarDetalle(String title) {
  return SliverAppBar(
    backgroundColor: colorBg,
    expandedHeight: 200,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: colorIconosAppBar,
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: AssetImage('images/recipe1.jpg'),
        image: AssetImage('images/recipe1.jpg'),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
