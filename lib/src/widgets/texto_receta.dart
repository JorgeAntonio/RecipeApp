import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';

Widget textoReceta() {
  return Column(
    children: [
      Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 20, top: 0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tacacho con cecina de la selva',
              textAlign: TextAlign.left,
              style: titlesRecipeStyle,
            ),
            Text(
              'Es una receta típica de la selva peruana, esta hecho a base de platano frito o cocido aplastado',
              textAlign: TextAlign.left,
              style: descriptionRecipeStyle,
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
                            '45 min',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              color: colorTitle,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: colorIconos,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                'Medio',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold,
                                  color: colorTitle,
                                  fontSize: 14,
                                ),
                              ),
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
      )
    ],
  );
}
