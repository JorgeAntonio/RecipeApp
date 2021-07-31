import 'package:flutter/material.dart';
import 'dart:io';
//Ads
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipe_app/src/delegates/buscar_receta_delegate.dart';
//Responsive
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Provider
import 'package:recipe_app/src/responsive.dart';
//Models
import 'package:recipe_app/src/models/populares_listado.dart';
import 'package:recipe_app/src/models/categorias_listado.dart';
//Widgets
import 'package:recipe_app/src/widgets/menu_lateral.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  @override
  void initState() {
    super.initState();
    // Load ads.
  }

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    _anchoredBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadingAnchoredBanner) {
      _loadingAnchoredBanner = true;
      _createAnchoredBanner(context);
    }
    return Scaffold(
        drawer: menuLateral(context),
        backgroundColor: background,
        appBar: AppBar(
          title: titles('Recetas Peruanas', 22, whiteColor),
          iconTheme: IconThemeData(color: whiteColor),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: RecetasSearchDelegate());
                },
                icon: Icon(
                  Icons.search,
                  color: whiteColor,
                )),
          ],
          backgroundColor: primaryColor,
        ),
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
                  if (_anchoredBanner != null)
                    Container(
                      color: Colors.red,
                      width: _anchoredBanner!.size.width.toDouble(),
                      height: _anchoredBanner!.size.height.toDouble(),
                      child: AdWidget(ad: _anchoredBanner!),
                    ),
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
