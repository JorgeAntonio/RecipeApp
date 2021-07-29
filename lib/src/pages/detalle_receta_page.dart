import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_detalles_page.dart';
import 'package:recipe_app/src/widgets/iconos_detalles.dart';
import 'package:recipe_app/src/widgets/texto_description.dart';
//Widgets
import 'package:recipe_app/src/widgets/titles.dart';

class DetallePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  @override
  _DetallePageState createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  String title;
  String image;
  String description;
  String ingredients;
  String steps;
  String time;
  String difficulty;
  String dinners;
  String video;

  int maxFailedLoadAttempts = 2;
  InterstitialAd _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
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
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
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
    _interstitialAd.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receta =
        ModalRoute.of(context).settings.arguments;

    return ValueListenableBuilder(
      valueListenable: Hive.box<Favorite>('favorits').listenable(),
      builder: (context, Box<Favorite> box, _) {
        return Form(
          key: widget.formKey,
          child: Scaffold(
            backgroundColor: background,
            body: CustomScrollView(
              slivers: [
                appBarDetallesPage(
                    image = receta['image'], title = receta['name']),
                _iconosDetalles(
                    time = receta['time'].toString(),
                    difficulty = receta['difficulty'],
                    dinners = receta['dinners'].toString(), [
                  IconButton(
                    icon: Icon(
                      box.containsKey(receta['name'])
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: box.containsKey(receta['name'])
                          ? onPrimaryColor
                          : onPrimaryColor,
                      size: 24,
                    ),
                    onPressed: () {
                      if (box.containsKey(receta['name'])) {
                        box.delete(receta['name']);
                      } else {
                        box.put(
                          receta['name'],
                          Favorite(
                            title: title,
                            image: image,
                            description: description,
                            ingredients: ingredients,
                            steps: steps,
                            time: time,
                            difficulty: difficulty,
                            dinners: dinners,
                            video: video,
                          ),
                        );
                      }
                    },
                  ),
                ]),
                textoDescripcion(description = receta['description'].toString(),
                    titles('Descripcion', 18, onPrimaryColor)),
                textoDescripcion(ingredients = receta['ingredients'].toString(),
                    titles('Ingredientes', 18, onPrimaryColor)),
                textoDescripcion(steps = receta['steps'].toString(),
                    titles('Preparacion', 18, onPrimaryColor)),
                _verVideo(
                  video = receta['video'],
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      onPressed: () {
                        _showInterstitialAd();
                        Navigator.pushNamed(context, 'video-receta',
                            arguments: receta);
                      },
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
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _iconosDetalles(
    String time, String difficulty, String dinners, List<Widget> actions) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Padding(
          padding: EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconosDetalles(time, difficulty, dinners, Row()),
              Row(
                children: actions,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _verVideo(String texto, Widget widget) {
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
