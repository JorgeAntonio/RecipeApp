import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/viewModels/categorias_listado.dart';
import 'package:recipe_app/src/viewModels/populares_listado.dart';
import 'package:recipe_app/src/viewModels/recetas_listado.dart';

class SwiperPopulars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 2,
      viewportFraction: 0.3,
    );

    return Container(
      height: 170,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: recetasProvider.cargarRecetasPopulares(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return PageView(
                controller: controller,
                children: popularesListado(context, snapshot.data),
              );
            },
          );
        },
        itemCount: 4,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}
