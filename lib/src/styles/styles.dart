import 'package:flutter/material.dart';

final colorBg = Color.fromRGBO(244, 252, 255, 1);
final colorTitle = Color.fromRGBO(211, 33, 45, 1);
final colorDescriptionRecipes = Color.fromRGBO(0, 51, 51, 1);
final colorIconos = Color.fromRGBO(243, 198, 36, 1);
final colorIconosAppBar = Color.fromRGBO(183, 195, 206, 11);
final rosa = Color.fromRGBO(255, 45, 85, 1.0);
final backgroundColor = Color.fromRGBO(247, 248, 250, 1.0);
final blanco = Colors.white;

final iconosRecetasListado = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.bold,
  color: rosa,
  fontSize: 14,
  shadows: [
    Shadow(
      color: Colors.black,
      offset: Offset(0.2, 0.2),
    )
  ],
);

final textoAcercaNosotros = TextStyle(
  color: Colors.black,
  fontFamily: 'Avenir',
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final textoBanner = TextStyle(
  fontFamily: 'PlayfairDisplay-bold',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  decorationStyle: TextDecorationStyle.wavy,
  shadows: [
    Shadow(
      color: rosa,
      offset: Offset(1, 1),
      blurRadius: 3,
    )
  ],
  fontSize: 28,
);
