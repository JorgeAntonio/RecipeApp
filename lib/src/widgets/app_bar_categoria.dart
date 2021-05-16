import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarCategoria() {
  return SliverAppBar(
    backgroundColor: colorBg,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: colorIconosAppBar,
    ),
  );
}
