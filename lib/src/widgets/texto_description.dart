import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget textoDescripcion(String texto, Widget widget) {
  return SliverList(
    delegate: SliverChildListDelegate([
      Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(16),
            child: widget,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              texto,
              textAlign: TextAlign.justify,
              style: textStyle,
            ),
          ),
        ],
      ),
    ]),
  );
}
