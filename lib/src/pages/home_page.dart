import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/receta_listado.dart';
import 'package:recipe_app/src/widgets/swiper_categorias.dart';
import 'package:recipe_app/src/widgets/swiper_populares.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menuLateral(context),
        key: _scaffoldKey,
        backgroundColor: colorBg,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, _scaffoldKey),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwiperPopulares(),
                      titles('Categorias'),
                      SwiperCategorias(),
                      titles('Recetas Populares'),
                      recetasListado(),
                      recetasListado(),
                      recetasListado(),
                      recetasListado(),
                      recetasListado(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
