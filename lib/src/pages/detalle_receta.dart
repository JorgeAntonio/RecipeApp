import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalle.dart';
import 'package:recipe_app/src/widgets/swiper_ingredientes.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class DetallePage extends StatelessWidget {
  final String descripcion =
      'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Soluta inventore officiis molestias, minus, asperiores a incidunt est doloremque aliquam autem, omnis fuga quos. Id ab quaerat earum placeat cum quis';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      body: CustomScrollView(
        slivers: [
          appBarDetalle('Pizza'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: Text('data'),
                  //textoReceta(titlesRecipeStyleDetalle),
                ),
                titles('Ingredientes', titlesStyle),
                SizedBox(height: 20),
                swiperIngredientes(),
                SizedBox(height: 20),
                titles('Preparación', titlesStyle),
                _textoDescripcion(descripcion),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _textoDescripcion(String texto) {
  return Container(
    margin: EdgeInsets.only(top: 5, left: 30, right: 30),
    child: Text(
      texto,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(15, 55, 91, 1),
        fontSize: 13,
      ),
    ),
  );
}
