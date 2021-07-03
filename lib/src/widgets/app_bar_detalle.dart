import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarDetalle(String image, String title) {
  return SliverAppBar(
    backgroundColor: rosa,
    expandedHeight: 270,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      opacity: 0.9,
      color: blanco,
    ),
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.all(15),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'PlayfairDisplay-bold',
            fontWeight: FontWeight.bold,
            color: blanco,
            fontSize: 22,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 2,
              )
            ]),
        //),
      ),
      background: FadeInImage(
        placeholder: NetworkImage(image),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
