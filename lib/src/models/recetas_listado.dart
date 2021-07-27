import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';
import 'package:transparent_image/transparent_image.dart';

List<Widget> recetasListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv = _cuerpoRecetaListado(context, receta);
    listadoRecetas.add(listadoWidgetProv);
  });

  return listadoRecetas;
}

Widget _cuerpoRecetaListado(BuildContext context, Map<String, dynamic> receta) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          offset: Offset(1, 5),
          blurRadius: 5.0,
        )
      ],
    ),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'detalle', arguments: receta);
          },
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: receta['image'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
                placeholder: (context, url) => FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: receta['image'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 170,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(8),
          child: titles(receta['name'], 20, onPrimaryColor),
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: iconosDetalles(
                receta['time'].toString(),
                receta['difficulty'].toString(),
                receta['dinners'].toString(),
                Text(''))),
      ],
    ),
  );
}
