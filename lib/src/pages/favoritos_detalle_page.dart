import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
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
  FavoritosDetallePage(this.title, this.image, this.description,
      this.ingredients, this.steps, this.time, this.difficulty, this.dinners,
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
          _appBar(widget.image, widget.title),
          _iconosDetalles(widget.time, widget.difficulty, widget.dinners),
          _textoDescripcion(
              widget.description, titles('Descripcion', 18, rosa)),
          _textoDescripcion(
              widget.ingredients, titles('Ingredientes', 18, rosa)),
          _textoDescripcion(widget.steps, titles('Preparacion', 18, rosa)),
        ],
      ),
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
        placeholder: AssetImage('images/recipe1.jpg'),
        image: NetworkImage(image),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _iconosDetalles(String time, String difficulty, String dinners) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
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
                children: [
                  Icon(
                    Icons.favorite,
                    color: rosa,
                  ),
                ],
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
