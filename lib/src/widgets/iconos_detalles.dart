import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget iconosDetalles(
    String time, String difficulty, String dinners, Widget widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Icon(
            Icons.alarm,
            color: onPrimaryColor,
            size: 24,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, top: 5),
            child: Text(
              time,
              style: iconosRecetasListado,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              ' min',
              style: iconosRecetasListado,
            ),
          ),
        ],
      ),
      SizedBox(width: 30),
      Row(
        children: [
          Icon(
            Icons.handyman,
            color: onPrimaryColor,
            size: 24,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, top: 5),
            child: Text(
              difficulty,
              style: iconosRecetasListado,
            ),
          )
        ],
      ),
      SizedBox(width: 30),
      Row(
        children: [
          Icon(
            Icons.people,
            color: onPrimaryColor,
            size: 24,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, top: 4),
            child: Text(
              dinners,
              style: iconosRecetasListado,
            ),
          )
        ],
      ),
    ],
  );
}
