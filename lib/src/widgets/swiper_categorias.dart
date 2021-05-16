import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/viewModels/categorias_listado.dart';

class SwiperCategorias extends StatelessWidget {
  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: recetasProvider.cargarCategorias(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return PageView(
                controller: controller,
                children: catergoriaListado(context),
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
