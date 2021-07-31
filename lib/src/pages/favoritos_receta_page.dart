import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/pages/favoritos_receta_video.dart';

import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalles_page.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
import 'package:recipe_app/src/widgets/texto_description.dart';
import 'package:recipe_app/src/widgets/titles.dart';

const int maxFailedLoadAttempts = 2;

class FavoritosDetallePage extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String ingredients;
  final String steps;
  final String time;
  final String difficulty;
  final String dinners;
  final String video;
  FavoritosDetallePage(
      this.title,
      this.image,
      this.description,
      this.ingredients,
      this.steps,
      this.time,
      this.difficulty,
      this.dinners,
      this.video,
      {Key? key})
      : super(key: key);

  @override
  _FavoritosDetallePageState createState() => _FavoritosDetallePageState();
}

class _FavoritosDetallePageState extends State<FavoritosDetallePage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        slivers: [
          appBarDetallesPage(widget.image, widget.title),
          _iconosDetalles(
              widget.time,
              widget.difficulty,
              widget.dinners,
              Icon(
                Icons.favorite,
                size: 24,
                color: onPrimaryColor,
              )),
          textoDescripcion(
              widget.description, titles('Descripcion', 18, onPrimaryColor)),
          textoDescripcion(
              widget.ingredients, titles('Ingredientes', 18, onPrimaryColor)),
          textoDescripcion(
              widget.steps, titles('Preparacion', 18, onPrimaryColor)),
          _verVideo(
            ValueListenableBuilder(
              valueListenable: Hive.box<Favorite>('favorits').listenable(),
              builder: (context, Box<Favorite> box, _) {
                return Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showInterstitialAd();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritoVideoReceta(
                                  widget.title,
                                  widget.video,
                                  widget.description)));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Text(
                      'Ver Video',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget _iconosDetalles(
    String time, String difficulty, String dinners, Icon icon) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconosDetalles(time, difficulty, dinners, Row()),
              Row(
                children: [icon],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _verVideo(Widget widget) {
  return SliverList(
    delegate: SliverChildListDelegate([
      Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8),
            child: widget,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              '',
              textAlign: TextAlign.justify,
              style: textStyle,
            ),
          ),
        ],
      ),
    ]),
  );
}
