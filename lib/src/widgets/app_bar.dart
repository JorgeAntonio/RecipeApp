import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Delegate
import 'package:recipe_app/src/delegates/buscar_receta_delegate.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:share/share.dart';

Widget appBar(BuildContext context) {
  return AppBar(
    /*title: Text(
      'Recetas Peruanas',
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        color: blanco,
      ),
    ),*/
    //centerTitle: true,
    actions: [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: RecetasSearchDelegate());
          },
          icon: Icon(
            Icons.search,
          )),
      Container(
        padding: EdgeInsets.only(right: 10),
        child: IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {
              Share.share(
                  'https://play.google.com/store/apps/details?id=co.eduardo.apprecetasperuana');
            }),
      ),
    ],
    backgroundColor: rosa,
  );
}
