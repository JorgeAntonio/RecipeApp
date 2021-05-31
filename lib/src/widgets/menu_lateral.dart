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
                image: AssetImage('images/ingredientes.jpg'),
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
              Icons.star,
              color: colorIconos,
            ),
            title: Text('Favoritos'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              color: colorIconos,
            ),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: colorIconos,
            ),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: colorIconos,
            ),
            title: Text('Salir'),
            onTap: () {
              Navigator.pushNamed(context, 'categoria');
            },
          ),
        ],
      ),
    ),
  );
}
