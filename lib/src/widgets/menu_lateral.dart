import 'dart:io';

import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';

Drawer menuLateral(context) {
  return Drawer(
    elevation: 0,
    child: Container(
      color: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                Image(
                  height: 90,
                  width: 90,
                  image: AssetImage('images/chef_logo.png'),
                ),
                Text(
                  'Recetas Peruanas',
                  style: textoBanner,
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: iconColor,
                ),
                title: titles('Favoritos', 18, primaryColor),
                onTap: () {
                  Navigator.pushNamed(context, 'favoritos');
                },
              ),
              /*ListTile(
                leading: Icon(
                  Icons.person,
                  color: iconColor,
                ),
                title: titles('Perfil', 18, primaryColor),
                onTap: () {},
              ),*/
              ListTile(
                leading: Icon(
                  Icons.question_answer,
                  color: iconColor,
                ),
                title: titles('Nosotros', 18, primaryColor),
                onTap: () {
                  Navigator.pushNamed(context, 'nosotros');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: iconColor,
                ),
                title: titles('Salir', 18, primaryColor),
                onTap: () {
                  exit(0);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
