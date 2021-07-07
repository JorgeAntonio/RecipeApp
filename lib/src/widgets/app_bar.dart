import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:share/share.dart';

Widget appBar() {
  return AppBar(
    title: CupertinoTextField(
      placeholder: 'Buscar',
      placeholderStyle: TextStyle(
        fontFamily: 'PlayfairDisplay-bold',
        fontWeight: FontWeight.w600,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 10),
        child: IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(
                  'https://play.google.com/store/apps/details?id=co.eduardo.apprecetasperuana');
            }),
      ),
    ],
    backgroundColor: rosa,
  );
}
