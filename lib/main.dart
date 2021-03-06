import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
import 'package:recipe_app/src/pages/nosotros_page.dart';
import 'package:recipe_app/src/pages/favoritos_page.dart';
import 'package:recipe_app/src/pages/categorias_page.dart';
import 'package:recipe_app/src/pages/detalle_receta_page.dart';
import 'package:recipe_app/src/pages/home_page.dart';
import 'package:recipe_app/src/pages/detalle_receta_video.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorits');
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'categoria': (BuildContext context) => CategoriaPage(),
        'detalle': (BuildContext context) => DetallePage(),
        'nosotros': (BuildContext context) => AcercaNosotros(),
        'favoritos': (BuildContext context) => FavoritoPage(),
        'video-receta': (BuildContext context) => VideoReceta(),
      },
    );
  }
}
