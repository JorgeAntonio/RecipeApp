import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarWithText(Widget widget) {
  return SliverAppBar(
    centerTitle: true,
    backgroundColor: primaryColor,
    floating: false,
    pinned: true,
    elevation: 3,
    iconTheme: IconThemeData(
      color: whiteColor,
    ),
    title: widget,
  );
}
