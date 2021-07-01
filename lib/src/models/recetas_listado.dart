import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/titles.dart';

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
  return Padding(
    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
    child: Card(
      elevation: 2,
      shadowColor: rosa,
      child: Column(
        children: [
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detalle', arguments: receta);
            },
            child: Container(
              padding: EdgeInsets.only(right: 8, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(receta['image']),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(left: 10, top: 0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titles(receta['name'], 20, rosa),
                Text(
                  receta['description'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.bold,
                    color: colorDescriptionRecipes,
                    fontSize: 14,
                  ),
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
                                  color: rosa,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              ' min',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.bold,
                                color: rosa,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.handyman,
                                  color: colorIconos,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    receta['difficulty'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.bold,
                                      color: rosa,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: colorIconos,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    receta['dinners'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.bold,
                                      color: rosa,
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
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}
