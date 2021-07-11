import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
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
    child: Container(
      decoration: BoxDecoration(
        color: blanco,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: rosa.withOpacity(0.3),
            offset: Offset(1, 1),
          ),
        ],
      ),
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
                child: FadeInImage(
                  placeholder: AssetImage('images/recipe1.jpg'),
                  image: NetworkImage(receta['image']),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 170,
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
                  textAlign: TextAlign.justify,
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
                              margin: EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                receta['time'].toString(),
                                style: iconosRecetasListado,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                ' min',
                                style: iconosRecetasListado,
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
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    receta['difficulty'].toString(),
                                    style: iconosRecetasListado,
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
                                  margin: EdgeInsets.only(left: 5, top: 4),
                                  child: Text(
                                    receta['dinners'].toString(),
                                    style: iconosRecetasListado,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border),
                                  color: colorIconos,
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
