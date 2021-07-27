import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalles_page.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
import 'package:recipe_app/src/widgets/texto_description.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';

class DetallePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  String title;
  String image;
  String description;
  String ingredients;
  String steps;
  String time;
  String difficulty;
  String dinners;
  String video;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receta =
        ModalRoute.of(context).settings.arguments;

    return ValueListenableBuilder(
      valueListenable: Hive.box<Favorite>('favorits').listenable(),
      builder: (context, Box<Favorite> box, _) {
        return Form(
          key: widget.formKey,
          child: Scaffold(
            backgroundColor: background,
            body: CustomScrollView(
              slivers: [
                appBarDetallesPage(
                    image = receta['image'], title = receta['name']),
                _iconosDetalles(
                    time = receta['time'].toString(),
                    difficulty = receta['difficulty'],
                    dinners = receta['dinners'].toString(), [
                  IconButton(
                    icon: Icon(
                      box.containsKey(receta['name'])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: box.containsKey(receta['name'])
                          ? onPrimaryColor
                          : onPrimaryColor,
                      size: 24,
                    ),
                    onPressed: () {
                      if (box.containsKey(receta['name'])) {
                        box.delete(receta['name']);
                      } else {
                        box.put(
                          receta['name'],
                          Favorite(
                            title: title,
                            image: image,
                            description: description,
                            ingredients: ingredients,
                            steps: steps,
                            time: time,
                            difficulty: difficulty,
                            dinners: dinners,
                            video: video,
                          ),
                        );
                      }
                    },
                  ),
                ]),
                textoDescripcion(description = receta['description'].toString(),
                    titles('Descripcion', 18, onPrimaryColor)),
                textoDescripcion(ingredients = receta['ingredients'].toString(),
                    titles('Ingredientes', 18, onPrimaryColor)),
                textoDescripcion(steps = receta['steps'].toString(),
                    titles('Preparacion', 18, onPrimaryColor)),
                _verVideoBtn(context, receta, video = receta['video']),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _iconosDetalles(
    String time, String difficulty, String dinners, List<Widget> actions) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconosDetalles(time, difficulty, dinners, Row()),
              Row(
                children: actions,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _verVideoBtn(
    BuildContext context, Map<String, dynamic> receta, String video) {
  return SliverList(
    delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'video-receta', arguments: receta);
          },
          child: Text(
            'Ver Video',
            style: TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir',
            ),
          ),
        ),
      ),
    ]),
  );
}
