import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarCategoria(Widget widget) {
  return SliverAppBar(
    centerTitle: true,
    backgroundColor: rosa,
    floating: false,
    pinned: true,
    elevation: 3,
    iconTheme: IconThemeData(
      color: blanco,
    ),
    title: widget,
  );
}
