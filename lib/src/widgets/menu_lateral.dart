import 'dart:io';

import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';
import 'package:share/share.dart';

Drawer menuLateral(context) {
  return Drawer(
    elevation: 0,
    child: Container(
      color: secondaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: onPrimaryColor),
                  child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('images/chef_logo.png'),
                  ),
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
                  color: onPrimaryColor,
                ),
                title: titles('Favoritos', 18, onPrimaryColor),
                onTap: () {
                  Navigator.pushNamed(context, 'favoritos');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: onPrimaryColor,
                ),
                title: titles('Compartir', 18, onPrimaryColor),
                onTap: () {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=co.eduardo.apprecetasperuana');
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
                  color: onPrimaryColor,
                ),
                title: titles('Nosotros', 18, onPrimaryColor),
                onTap: () {
                  Navigator.pushNamed(context, 'nosotros');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: onPrimaryColor,
                ),
                title: titles('Salir', 18, onPrimaryColor),
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
