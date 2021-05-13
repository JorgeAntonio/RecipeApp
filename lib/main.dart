import 'package:flutter/material.dart';
import 'package:recipe_app/src/pages/categorias.dart';
import 'package:recipe_app/src/pages/detalle_receta.dart';
import 'package:recipe_app/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      */
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'categoria': (BuildContext context) => CategoriaPage(),
        'detalle': (BuildContext context) => DetallePage(),
      },
    );
  }
}
