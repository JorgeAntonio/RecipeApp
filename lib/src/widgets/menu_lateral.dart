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
              color: rosa,
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
                  color: colorIconos,
                ),
                title: titles('Favoritos', 18, rosa),
                onTap: () {
                  Navigator.pushNamed(context, 'favoritos');
                },
              ),
              /*ListTile(
                leading: Icon(
                  Icons.person,
                  color: colorIconos,
                ),
                title: titles('Perfil', 18, rosa),
                onTap: () {},
              ),*/
              ListTile(
                leading: Icon(
                  Icons.question_answer,
                  color: colorIconos,
                ),
                title: titles('Nosotros', 18, rosa),
                onTap: () {
                  Navigator.pushNamed(context, 'nosotros');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: colorIconos,
                ),
                title: titles('Salir', 18, rosa),
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
