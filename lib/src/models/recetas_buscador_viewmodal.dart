import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';

List<Widget> recetasListadoBuscador(
    BuildContext context, List<dynamic> recetas, String recetaBuscada) {
  final List<Widget> listadoRecetas = [];
  recetas.forEach((receta) {
    var titulo = receta['name'].toString().toLowerCase();
    if (titulo.contains(recetaBuscada)) {
      final listadoWidgetProv = _cuerpoRecetaListado(context, receta);
      listadoRecetas.add(listadoWidgetProv);
    }
  });

  return listadoRecetas;
}

Widget _cuerpoRecetaListado(BuildContext context, Map<String, dynamic> receta) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: blanco,
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
              child: FadeInImage(
                placeholder: AssetImage('images/chef_logo.png'),
                image: NetworkImage(receta['image']),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 170,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                    ],
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
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
