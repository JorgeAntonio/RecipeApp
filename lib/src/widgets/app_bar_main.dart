import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Delegate
import 'package:recipe_app/src/delegates/buscar_receta_delegate.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Widgets

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: titles('Recetas Peruanas', 22, whiteColor),
    iconTheme: IconThemeData(color: whiteColor),
    actions: [
      IconButton(
          onPressed: () {
            showSearch(context: context, delegate: RecetasSearchDelegate());
          },
          icon: Icon(
            Icons.search,
            color: whiteColor,
          )),
    ],
    backgroundColor: primaryColor,
  );
}
