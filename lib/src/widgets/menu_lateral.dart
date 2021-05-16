import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Drawer menuLateral(context) {
  return Drawer(
    elevation: 0,
    child: Container(
      color: colorBg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/recipe1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'RECETAS APP',
                style: estiloTextoMenuLateral,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: colorIconos,
            ),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: colorIconos,
            ),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: colorIconos,
            ),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: colorIconos,
            ),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
        ],
      ),
    ),
  );
}
