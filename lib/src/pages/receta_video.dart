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
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: rosa,
            title: Text(
              receta['name'],
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
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                  color: blanco,
                  borderRadius: BorderRadius.circular(10),
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
                        receta['description'],
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
              )
            ],
          ),
        );
      },
    );
  }
}
