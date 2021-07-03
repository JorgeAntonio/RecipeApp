import 'package:flutter/material.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_categoria.dart';

class AcercaNosotros extends StatelessWidget {
  const AcercaNosotros({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        //appBar:
        body: CustomScrollView(
          slivers: [
            appBarCategoria(
              Text(
                'Acerca de nosotros',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay-bold',
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  width: double.infinity,
                  color: rosa,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/ingredientes.jpg'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Recetas Peruanas',
                          style: TextStyle(
                            color: blanco,
                            fontFamily: 'PlayfairDisplay-bold',
                            fontSize: 34,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Esta aplicación esta hecha con amor para todos los amantes de la deliciosa comida peruana.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          //fontFamily: 'PlayfairDisplay-bold',
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                          /*shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                          )
                        ],*/
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Developed by CoDevPro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/gmail.png'),
                        ),
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/web-outlook.png'),
                        ),
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/web-whatsapp.png'),
                        ),
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/telegram.png'),
                        ),
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/web-facebook.png'),
                        ),
                        Image(
                          width: 30,
                          height: 30,
                          image: AssetImage('images/tweetdeck.png'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
