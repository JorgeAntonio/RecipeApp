import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/models/populares_listado.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';

class SwiperPopulars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      viewportFraction: 0.4,
    );

    return Container(
      height: 170,
      child: Swiper(
        viewportFraction: 1.0,
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: recetasProvider.cargarRecetasPopulares(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: popularesListado(context, snapshot.data),
              );
            },
          );
        },
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}
