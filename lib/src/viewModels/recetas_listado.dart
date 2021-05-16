import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

List<Widget> recetasListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv =
        _cuerpoRecetaListado(context, titlesRecipeStyle, receta);
    listadoRecetas.add(listadoWidgetProv);
  });

  return listadoRecetas;
}

Widget _cuerpoRecetaListado(
    BuildContext context, TextStyle estilos, Map<String, dynamic> receta) {
  return Column(
    children: [
      SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'detalle');
        },
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(receta['image']),
              fit: BoxFit.fill,
              width: 480,
              height: 180,
            ),
          ),
        ),
      ),
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 20, top: 0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receta['name'],
              textAlign: TextAlign.left,
              style: estilos,
            ),
            Text(
              receta['description'],
              textAlign: TextAlign.left,
              style: descriptionRecipeStyle,
            ),
            SizedBox(height: 5),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: colorIconos,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            receta['time'].toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              color: colorTitle,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: colorIconos,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                receta['difficulty'].toString(),
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold,
                                  color: colorTitle,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
