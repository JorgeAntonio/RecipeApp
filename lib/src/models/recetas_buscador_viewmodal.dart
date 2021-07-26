import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
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
              titles(receta['name'], 20, primaryColor),
              Text(
                receta['description'],
                textAlign: TextAlign.justify,
                style: textStyle,
              ),
              SizedBox(height: 5),
              iconosDetalles(
                  receta['time'].toString(),
                  receta['difficulty'].toString(),
                  receta['dinners'].toString(),
                  Text(''))
            ],
          ),
        ),
      ],
    ),
  );
}
