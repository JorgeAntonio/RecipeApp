import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoReceta extends StatefulWidget {
  VideoReceta({Key key}) : super(key: key);

  @override
  _VideoRecetaState createState() => _VideoRecetaState();
}

class _VideoRecetaState extends State<VideoReceta> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> receta =
        ModalRoute.of(context).settings.arguments;
    bool isUrl = receta['video'] != null;
    var url = receta['video'];
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(isUrl ? url : ''),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
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
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
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
              )
            ],
          ),
        );
      },
    );
  }
}
