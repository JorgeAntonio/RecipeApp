import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:transparent_image/transparent_image.dart';

Widget appBarDetallesPage(String image, String title) {
  return SliverAppBar(
    backgroundColor: primaryColor,
    expandedHeight: 270,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: whiteColor,
    ),
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            color: surfaceColor,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0.5, 0.5),
                blurRadius: 1,
              )
            ],
          ),
        ),
      ),
      background: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: image,
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
