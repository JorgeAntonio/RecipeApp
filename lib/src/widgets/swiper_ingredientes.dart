import 'package:flutter/material.dart';
import 'package:recipe_app/src/models/ingredientes_listado.dart';

final controller = PageController(
  initialPage: 1,
  viewportFraction: 0.3,
);

Widget swiperIngredientes(List<dynamic> ingredients) {
  return Container(
    height: 120,
    padding: EdgeInsets.only(left: 5),
    child: ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return PageView(
          controller: controller,
          children: ingredientesListado(ingredients),
        );
      },
    ),
  );
}
