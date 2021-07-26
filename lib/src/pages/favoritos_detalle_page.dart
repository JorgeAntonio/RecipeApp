import 'package:flutter/material.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/pages/favorito_receta_video.dart';

import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalles_page.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
import 'package:recipe_app/src/widgets/texto_description.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class FavoritosDetallePage extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String ingredients;
  final String steps;
  final String time;
  final String difficulty;
  final String dinners;
  final String video;
  FavoritosDetallePage(
      this.title,
      this.image,
      this.description,
      this.ingredients,
      this.steps,
      this.time,
      this.difficulty,
      this.dinners,
      this.video,
      {Key key})
      : super(key: key);

  @override
  _FavoritosDetallePageState createState() => _FavoritosDetallePageState();
}

class _FavoritosDetallePageState extends State<FavoritosDetallePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          appBarDetallesPage(widget.image, widget.title),
          _iconosDetalles(
              widget.time,
              widget.difficulty,
              widget.dinners,
              Icon(
                Icons.favorite,
                size: 24,
                color: primaryColor,
              )),
          textoDescripcion(
              widget.description, titles('Descripcion', 18, primaryColor)),
          textoDescripcion(
              widget.ingredients, titles('Ingredientes', 18, primaryColor)),
          textoDescripcion(
              widget.steps, titles('Preparacion', 18, primaryColor)),
          _btnVerVideo(context, widget.title, widget.video, widget.description),
        ],
      ),
    );
  }
}

Widget _iconosDetalles(
    String time, String difficulty, String dinners, Icon icon) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconosDetalles(time, difficulty, dinners, Row()),
              Row(
                children: [icon],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _btnVerVideo(
    BuildContext context, String title, String video, String description) {
  return SliverList(
    delegate: SliverChildListDelegate([
      ValueListenableBuilder(
        valueListenable: Hive.box<Favorite>('favorits').listenable(),
        builder: (context, Box<Favorite> box, _) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FavoritoVideoReceta(title, video, description)));
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              child: Text(
                'Ver Video',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
          );
        },
      ),
    ]),
  );
}
