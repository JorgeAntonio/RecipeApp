import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalle.dart';
//import 'package:recipe_app/src/widgets/swiper_ingredientes.dart';
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
          appBarDetalle(receta['image']),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: titles(receta['name'], 22, rosa),
                ),
                _cuerpoReceta(receta),
                SizedBox(height: 3),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: titles('Ingredientes', 22, rosa),
                ),
                _textoDescripcion(receta['ingredients'].toString()),
                //swiperIngredientes(receta['ingredients']),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: titles('Preparación', 22, rosa),
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
    margin: EdgeInsets.only(left: 20, top: 0, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                              color: colorTitle,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
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
  );
}

Widget _textoDescripcion(String texto) {
  return Container(
      margin: EdgeInsets.only(top: 5, left: 20, right: 20),
      child: ListTile(
        subtitle: Text(
          texto,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 51, 51, 1),
            fontSize: 13,
          ),
        ),
      )

      /*Text(
      texto,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 51, 51, 1),
        fontSize: 13,
      ),
    ),*/
      );
}
