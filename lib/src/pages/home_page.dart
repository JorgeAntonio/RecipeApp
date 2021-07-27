import 'package:flutter/material.dart';
import 'dart:io';
//Ads
import 'package:google_mobile_ads/google_mobile_ads.dart';
//Responsive
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Provider
import 'package:recipe_app/src/responsive.dart';
//Models
import 'package:recipe_app/src/models/populares_listado.dart';
import 'package:recipe_app/src/models/categorias_listado.dart';
//Widgets
import 'package:recipe_app/src/widgets/app_bar_main.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716',
    size: AdSize.banner,
    request: AdRequest(),
    listener: AdListener(),
  );

  @override
  void initState() {
    super.initState();
    // Load ads.
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    //final AdWidget adWidget = AdWidget(ad: myBanner);
    return Scaffold(
        drawer: menuLateral(context),
        backgroundColor: background,
        appBar: appBarMain(context),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: titles('Populares', 24, onPrimaryColor),
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
                    child: titles('Categorias', 24, onPrimaryColor),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            _gridCategorias(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    width: 320,
                    child: AdWidget(ad: myBanner),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _sliderPopulares(BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: background),
    width: isMobile(context) ? 150 : 200,
    height: isMobile(context) ? 230 : 300,
    child: FutureBuilder(
      future: recetasProvider.cargarRecetasPopulares(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: popularesListado(context, snapshot.data),
        );
      },
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
