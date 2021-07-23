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
          backgroundColor: backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: rosa,
            title: Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                  color: blanco,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    )
                  ]),
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blanco,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(210, 211, 215, 1.0),
                      offset: Offset(1, 5),
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: player,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 51, 51, 1),
                          fontSize: 13,
                        ),
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
