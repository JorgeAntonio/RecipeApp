import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/src/adapters/favoritos_adapter.dart';
import 'package:recipe_app/src/pages/favoritos_detalle_page.dart';
import 'package:recipe_app/src/responsive.dart';
import 'package:recipe_app/src/styles/styles.dart';

class FavoritoPage extends StatefulWidget {
  const FavoritoPage({Key key}) : super(key: key);

  @override
  _FavoritoPageState createState() => _FavoritoPageState();
}

class _FavoritoPageState extends State<FavoritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'Favoritos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir',
              fontSize: 22,
            ),
          ),
        ),
        body: cuerpo(context));
  }
}

Widget cuerpo(BuildContext context) {
  return ValueListenableBuilder(
    valueListenable: Hive.box<Favorite>('favorits').listenable(),
    builder: (context, Box<Favorite> box, _) {
      if (box.values.isEmpty) {
        return Center(
          child: Text(
            'Elige tus recetas favoritas y se mostrarán aquí.',
            textAlign: TextAlign.center,
            style: textoAcercaNosotros,
          ),
        );
      }
      return ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          final Favorite favorite = box.getAt(index);
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoritosDetallePage(
                                favorite.title,
                                favorite.image,
                                favorite.description,
                                favorite.ingredients,
                                favorite.steps,
                                favorite.time,
                                favorite.difficulty,
                                favorite.dinners,
                                favorite.video,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(210, 211, 215, 1.0),
                        offset: Offset(1, 5),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('images/chef_logo.png'),
                            image: NetworkImage(favorite.image),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: isMobile(context) ? 180 : 720,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.grey.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: Text(
                              favorite.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isMobile(context) ? 20 : 32,
                                  fontWeight: FontWeight.w600,
                                  decorationColor: Colors.black,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            await box.deleteAt(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: primaryColor.withOpacity(0.5),
                                      offset: Offset(1, 1)),
                                ]),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
