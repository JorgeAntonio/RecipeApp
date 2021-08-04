import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoReceta extends StatefulWidget {
  VideoReceta({Key? key}) : super(key: key);

  @override
  _VideoRecetaState createState() => _VideoRecetaState();
}

class _VideoRecetaState extends State<VideoReceta> {
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
    Map<String, dynamic>? receta =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    var url = receta!['video'];
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: false,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        onEnded: (data) {
          _controller.load(receta['video']);
          _showSnackBar('Gracias por ver. Apoya el contenido en YouTube.');
        },
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: whiteColor),
            title: Text(
              receta['name'],
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: whiteColor,
                fontSize: 22,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 16, left: 16),
                color: background,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: player,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        receta['description'],
                        textAlign: TextAlign.justify,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  if (_anchoredBanner != null)
                    Container(
                      color: Colors.transparent,
                      width: _anchoredBanner!.size.width.toDouble(),
                      height: _anchoredBanner!.size.height.toDouble(),
                      child: AdWidget(ad: _anchoredBanner!),
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
