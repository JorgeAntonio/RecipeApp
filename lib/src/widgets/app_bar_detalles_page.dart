import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBarDetallesPage(String image, String title) {
  return SliverAppBar(
    backgroundColor: primaryColor,
    expandedHeight: 270,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      opacity: 0.9,
      color: whiteColor,
    ),
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.all(15),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            color: whiteColor,
            fontSize: 22,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 3,
              )
            ]),
      ),
      background: FadeInImage(
        placeholder: AssetImage('images/chef_logo.png'),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}
