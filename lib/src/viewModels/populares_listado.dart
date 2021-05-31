import 'package:flutter/material.dart';

List<Widget> popularesListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv = _cuerpoPopularesListado(context, receta);
    listadoRecetas.add(listadoWidgetProv);
  });

  return listadoRecetas;
}

Widget _cuerpoPopularesListado(
    BuildContext context, Map<String, dynamic> receta) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'detalle', arguments: receta);
    },
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5, left: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(receta['image']),
              fit: BoxFit.cover,
              //width: 150,
              height: 160,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20),
          child: Text(
            receta['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
        )
      ],
    ),
  );
}
