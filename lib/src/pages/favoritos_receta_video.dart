import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FavoritoVideoReceta extends StatefulWidget {
  final String title;
  final String video;
  final String description;
  FavoritoVideoReceta(this.title, this.video, this.description, {Key? key})
      : super(key: key);

  @override
  _FavoritoVideoRecetaState createState() => _FavoritoVideoRecetaState();
}

class _FavoritoVideoRecetaState extends State<FavoritoVideoReceta> {
  late YoutubePlayerController _controller;

  bool _isPlayerReady = false;

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
    // Load video
    _controller = YoutubePlayerController(
      initialVideoId: widget.video,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
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

  void listener() {
    if (_isPlayerReady && mounted && _controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _anchoredBanner?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadingAnchoredBanner) {
      _loadingAnchoredBanner = true;
      _createAnchoredBanner(context);
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(widget.video);
          _showSnackBar('Gracias por ver. Apoya el contenido en YouTube.');
        },
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryColor,
            iconTheme: IconThemeData(color: whiteColor),
            title: Text(
              widget.title,
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
                color: background,
                margin: EdgeInsets.only(top: 20, right: 16, left: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: player,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        widget.description,
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
                      color: Colors.red,
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
