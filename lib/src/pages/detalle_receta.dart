import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
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

  /*submitData() async {
    if (widget.formKey.currentState.validate()) {
      Box<Favorite> todoFavorito = Hive.box<Favorite>('favorits');
      todoFavorito.add(Favorite(
        title: title,
        image: image,
        description: description,
        ingredients: ingredients,
        steps: steps,
        time: time,
        difficulty: difficulty,
        dinners: dinners,
      ));
    }
  }*/

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
            backgroundColor: colorBg,
            body: CustomScrollView(
              slivers: [
                _appBar(image = receta['image'], title = receta['name']),
                _iconosDetalles(
                    time = receta['time'].toString(),
                    difficulty = receta['difficulty'],
                    dinners = receta['dinners'].toString(), [
                  IconButton(
                    icon: Icon(
                      box.containsKey(receta['name'])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: rosa,
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
                _textoDescripcion(
                    description = receta['description'].toString(),
                    titles('Descripcion', 18, rosa)),
                _textoDescripcion(
                    ingredients = receta['ingredients'].toString(),
                    titles('Ingredientes', 18, rosa)),
                _textoDescripcion(steps = receta['steps'].toString(),
                    titles('Preparacion', 18, rosa)),
                _verVideoBtn(context, receta, video = receta['video']),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _appBar(String image, String title) {
  return SliverAppBar(
    backgroundColor: rosa,
    expandedHeight: 270,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      opacity: 0.9,
      color: blanco,
    ),
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.all(15),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
            color: blanco,
            fontSize: 22,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
                blurRadius: 3,
              )
            ]),
      ),
      background: FadeInImage(
        placeholder: AssetImage('images/chef_logo.png'),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _iconosDetalles(
    String time, String difficulty, String dinners, List<Widget> actions) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.alarm,
                color: colorIconos,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  time,
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
                      difficulty,
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
                      dinners,
                      style: iconosRecetasListado,
                    ),
                  )
                ],
              ),
              SizedBox(width: 30),
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

Widget _textoDescripcion(String texto, Widget widget) {
  return SliverList(
    delegate: SliverChildListDelegate([
      Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8),
            child: widget,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              texto,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 51, 51, 1),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ]),
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
            primary: rosa,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'video-receta', arguments: receta);
          },
          child: Text(
            'Ver Video',
            style: TextStyle(
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
