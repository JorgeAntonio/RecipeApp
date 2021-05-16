import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_categoria.dart';
import 'package:recipe_app/src/widgets/swiper_populares.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      body: CustomScrollView(
        slivers: [
          appBarCategoria(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                titles('Pizza', titlesStyleCategoria),
                SwiperPopulares(),
                /*
                recetasListadoWidget(context),
                recetasListadoWidget(context),
                recetasListadoWidget(context),
                recetasListadoWidget(context),
                */
              ],
            ),
          )
        ],
      ),
    );
  }
}
