import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// Responsive
import 'package:recipe_app/src/responsive.dart';
import 'package:transparent_image/transparent_image.dart';

List<Widget> popularesListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv = _tarjetaCollection(context, receta);
    listadoRecetas.add(listadoWidgetProv);
  });

  return listadoRecetas;
}

Widget _tarjetaCollection(BuildContext context, Map<String, dynamic> receta) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'detalle', arguments: receta);
    },
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(210, 211, 215, 1.0),
            offset: Offset(1, 5),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                placeholder: (context, url) => FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: receta['image'],
                ),
                imageUrl: receta['image'],
                fit: BoxFit.cover,
                width: isMobile(context) ? 150 : 200,
                height: isMobile(context) ? 230 : 300,
              ),
            ),
          ),
          Container(
            width: isMobile(context) ? 150 : 200,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              receta['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.wavy,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 2),
                      blurRadius: 2.5,
                    )
                  ]),
            ),
          )
        ],
      ),
    ),
  );
}
