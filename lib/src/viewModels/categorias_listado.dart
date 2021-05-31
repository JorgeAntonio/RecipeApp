import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';

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
      child: Stack(
        children: [
          Container(
            width: 170,
            height: 180,
            padding: EdgeInsets.only(left: 10, top: 20, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(categoria['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              categoria['name'],
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
