import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPopulares extends StatelessWidget {
  final controller = PageController(
    initialPage: 1,
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return PageView(
              controller: controller,
              children: [
                _tarjeta(),
                _tarjeta(),
                _tarjeta(),
                _tarjeta(),
              ],
            );
          },
          itemCount: 3,
          itemWidth: 600,
          itemHeight: 600,
          layout: SwiperLayout.STACK,
        ));
  }
}

Widget _tarjeta() {
  return Container(
    margin: EdgeInsets.only(left: 30),
    child: Image(
      image: AssetImage('images/recipe-slider1.png'),
    ),
  );
}
