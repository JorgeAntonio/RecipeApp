import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/viewModels/categorias_listado.dart';

class CardCategorias extends StatelessWidget {
  final controller = PageController(
    initialPage: 2,
    //viewportFraction: 0.2,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: 350,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: FutureBuilder(
        future: recetasProvider.cargarCategorias(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return GridView.count(
            controller: controller,
            crossAxisCount: 2,
            children: catergoriaListado(context),
          );
        },
      ),
    );
  }
}
