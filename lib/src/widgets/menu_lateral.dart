import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/titles.dart';

Drawer menuLateral(context) {
  return Drawer(
    elevation: 0,
    child: Container(
      color: rosa,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ingredientes.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Recetas Peruanas',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay-bold',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                  shadows: [
                    Shadow(
                      color: rosa,
                      offset: Offset(1, 3),
                      blurRadius: 3,
                    )
                  ],
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: rosa,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: colorIconos,
                    ),
                    title: titles('Favoritos', 18, blanco),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: colorIconos,
                    ),
                    title: titles('Perfil', 18, blanco),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      color: colorIconos,
                    ),
                    title: titles('Nosotros', 18, blanco),
                    onTap: () {
                      Navigator.pushNamed(context, 'nosotros');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: colorIconos,
                    ),
                    title: titles('Salir', 18, blanco),
                    onTap: () {
                      exit(0);
                      //Tooltip(message: 'Close app');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
