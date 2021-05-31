import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarDetalle(String image) {
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
        placeholder: NetworkImage(image),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
