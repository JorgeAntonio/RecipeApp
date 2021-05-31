import 'package:flutter/material.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
//ViewModels
import 'package:recipe_app/src/viewModels/recetas_listado.dart';
//Widgets
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/card_categorias.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/swiper_categorias.dart';
import 'package:recipe_app/src/widgets/swiper_populars.dart';
//import 'package:recipe_app/src/widgets/swiper_populares.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

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
                    children: [
                      //SwiperPopulares(),
                      titles('Populares', titlesStyle),
                      SizedBox(height: 10),
                      SwiperPopulars(),
                      titles('Categorias', titlesStyle),
                      //SwiperCategorias(),
                      /*titles('Recetas Populares', titlesStyle),
                      FutureBuilder(
                        future: recetasProvider.cargarRecetasPopulares(),
                        initialData: [],
                        builder: (BuildContext context,
                            AsyncSnapshot<List<dynamic>> snapshot) {
                          return Column(
                            children: recetasListado(context, snapshot.data),
                          );
                        },
                      ),*/
                      CardCategorias(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
