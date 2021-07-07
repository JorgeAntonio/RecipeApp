import 'package:flutter/material.dart';
import 'package:recipe_app/src/pages/acerca_nosotros.dart';
import 'package:recipe_app/src/pages/categorias_page.dart';
import 'package:recipe_app/src/pages/detalle_receta.dart';
import 'package:recipe_app/src/pages/favorites_page.dart';
import 'package:recipe_app/src/pages/home_page.dart';
import 'package:recipe_app/src/pages/splashscreen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashScreenPage(),
        'home': (BuildContext context) => HomePage(),
        'categoria': (BuildContext context) => CategoriaPage(),
        'detalle': (BuildContext context) => DetallePage(),
        'nosotros': (BuildContext context) => AcercaNosotros(),
        'favoritos': (BuildContext context) => FavoritesPage(),
      },
    );
  }
}
