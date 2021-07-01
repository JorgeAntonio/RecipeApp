import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget appBar() {
  return AppBar(
    title: CupertinoTextField(
      placeholder: 'Buscar',
    ),
    actions: [
      Container(
        padding: EdgeInsets.all(20),
        child: Icon(Icons.share),
      )
    ],
    backgroundColor: rosa,
  );
}
