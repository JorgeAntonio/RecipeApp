import 'package:flutter/material.dart';

final backgroundColor = Color.fromRGBO(247, 248, 250, 1.0);
final iconColor = Color.fromRGBO(255, 45, 85, 1.0);
final descriptionTextColor = Color.fromRGBO(0, 51, 51, 1);
final primaryColor = Color.fromRGBO(255, 45, 85, 1.0);
final whiteColor = Colors.white;

final textStyle = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.bold,
  color: descriptionTextColor,
  fontSize: 14,
);

final iconosRecetasListado = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.bold,
    color: primaryColor,
    fontSize: 14,
    shadows: [Shadow(color: Colors.black, offset: Offset(0.2, 0.2))]);

final textoAcercaNosotros = TextStyle(
  color: Colors.black,
  fontFamily: 'Avenir',
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

final textoBanner = TextStyle(
  fontFamily: 'Avenir',
  fontWeight: FontWeight.bold,
  color: Colors.white,
  decorationStyle: TextDecorationStyle.wavy,
  fontSize: 22,
  shadows: [
    Shadow(
      color: primaryColor,
      offset: Offset(1, 1),
      blurRadius: 3,
    )
  ],
);
