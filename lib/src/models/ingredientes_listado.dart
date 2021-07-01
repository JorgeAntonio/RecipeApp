import 'package:flutter/material.dart';

List<Widget> ingredientesListado(List<dynamic> ingredientes) {
  final List<Widget> listadoIngredientes = [];
  final List<dynamic> ingredientesListado = ingredientes;

  ingredientesListado.forEach((ingrediente) {
    final Widget widgetProv = _imagen(ingrediente);
    listadoIngredientes.add(widgetProv);
  });
  return listadoIngredientes;
}

Widget _imagen(Map<String, dynamic> ingrediente) {
  return Center(
      child: Stack(
    children: [
      Container(
        width: 130,
        height: 100,
        margin: EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: NetworkImage(ingrediente['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(20),
        child: Text(
          ingrediente['name'],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            decorationColor: Colors.black,
            decorationStyle: TextDecorationStyle.wavy,
          ),
        ),
      )
    ],
  ));
}
