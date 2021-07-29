import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:recipe_app/src/styles/styles.dart';

class ShowAd extends StatefulWidget {
  ShowAd({Key key}) : super(key: key);

  @override
  _ShowAdState createState() => _ShowAdState();
}

class _ShowAdState extends State<ShowAd> {
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
    Map<String, dynamic> receta;
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
            ),
            onPressed: () {
              _showInterstitialAd();
              Navigator.pushNamed(context, 'video-receta', arguments: receta);
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
      ]),
    );
  }
}
