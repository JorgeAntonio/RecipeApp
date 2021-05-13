import 'package:flutter/material.dart';
import 'package:recipe_app/src/widgets/texto_receta.dart';

Widget recetasListado() {
  return Column(
    children: [
      SizedBox(height: 20),
      GestureDetector(
        onTap: () {},
        child: Image(
          image: AssetImage('images/recipe-slider1.png'),
          fit: BoxFit.fill,
          width: 480,
          height: 180,
        ),
      ),
      textoReceta(),
    ],
  );
}
