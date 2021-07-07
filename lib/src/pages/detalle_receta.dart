import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/app_bar_detalle.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receta =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colorBg,
      body: CustomScrollView(
        slivers: [
          appBarDetalle(receta['image'], receta['name']),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _cuerpoReceta(receta),
                SizedBox(height: 3),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: titles('Ingredientes', 20, rosa),
                ),
                _textoDescripcion(receta['ingredients'].toString()),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: titles('Preparación', 20, rosa),
                ),
                _textoDescripcion(receta['steps'].toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _cuerpoReceta(Map<String, dynamic> receta) {
  return Container(
    alignment: AlignmentDirectional.topStart,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 5),
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Text(
            receta['description'],
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
              color: colorDescriptionRecipes,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}

Widget _textoDescripcion(String texto) {
  return Container(
    margin: EdgeInsets.only(top: 5, left: 20, right: 20),
    child: Text(
      texto,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 51, 51, 1),
        fontSize: 13,
      ),
    ),
  );
}
