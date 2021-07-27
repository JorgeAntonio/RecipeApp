import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FavoritoVideoReceta extends StatefulWidget {
  final String title;
  final String video;
  final String description;
  FavoritoVideoReceta(this.title, this.video, this.description, {Key key})
      : super(key: key);

  @override
  _FavoritoVideoRecetaState createState() => _FavoritoVideoRecetaState();
}

class _FavoritoVideoRecetaState extends State<FavoritoVideoReceta> {
  @override
  Widget build(BuildContext context) {
    bool isUrl = widget.video != null;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(isUrl ? widget.video : ''),
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
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
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
            ],
          ),
        );
      },
    );
  }
}
