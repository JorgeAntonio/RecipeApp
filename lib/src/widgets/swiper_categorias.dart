import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
          return PageView(
            controller: controller,
            children: [
              _imageCategoria(context),
              _imageCategoria(context),
              _imageCategoria(context),
              _imageCategoria(context),
            ],
          );
        },
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}

Widget _imageCategoria(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'categoria');
    },
    child: Container(
      child: Image(
        image: AssetImage('images/recipe-slider1.png'),
      ),
    ),
  );
}
