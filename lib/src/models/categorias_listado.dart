import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:transparent_image/transparent_image.dart';

List<Widget> catergoriaListado(BuildContext context) {
  final List<Widget> listadoCategoria = [];
  final List<dynamic> categorias = recetasProvider.categorias;

  categorias.forEach((categoria) {
    final Widget widgetProv = _imageCategoria(context, categoria);
    listadoCategoria.add(widgetProv);
  });
  return listadoCategoria;
}

Widget _imageCategoria(BuildContext context, Map<String, dynamic> categoria) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'categoria', arguments: categoria);
    },
    child: Container(
      margin: EdgeInsets.all(8),
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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: categoria['image'],
                placeholder: (context, url) => FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: categoria['image'],
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
            child: Text(
              categoria['name'],
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
