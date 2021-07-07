import 'package:flutter/material.dart';
//Responsive
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Provider
import 'package:recipe_app/src/responsive.dart';
//Models
import 'package:recipe_app/src/models/populares_listado.dart';
import 'package:recipe_app/src/models/categorias_listado.dart';
//Widgets
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menuLateral(context),
        backgroundColor: backgroundColor,
        appBar: appBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: titles('Populares', 24, rosa),
                  ),
                  SizedBox(height: 10),
                  _sliderPopulares(context),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: titles('Categorias', 24, rosa),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            _gridCategorias(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _sliderPopulares(BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: backgroundColor),
    width: isMobile(context) ? 150 : 200,
    height: isMobile(context) ? 230 : 300,
    child: Swiper(
      viewportFraction: 1.0,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
            future: recetasProvider.cargarRecetasPopulares(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: popularesListado(context, snapshot.data),
              );
            });
      },
      index: 3,
    ),
  );
}

Widget _gridCategorias(BuildContext context) {
  return Container(
    child: FutureBuilder(
      future: recetasProvider.cargarCategorias(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SliverGrid.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: 3,
          children: catergoriaListado(context),
        );
      },
    ),
  );
}
