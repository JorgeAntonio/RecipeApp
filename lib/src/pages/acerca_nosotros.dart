import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/widgets/app_bar_with_text.dart';
//Widgets

class AcercaNosotros extends StatelessWidget {
  const AcercaNosotros({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: CustomScrollView(
          slivers: [
            appBarWithText(
              Text(
                '',
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  width: double.infinity,
                  color: primaryColor,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image(
                          width: 100,
                          height: 100,
                          image: AssetImage('images/chef_logo.png'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Recetas Peruanas',
                          style: textoBanner,
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
                      style: textoAcercaNosotros,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Developed by CoDevPro',
                      textAlign: TextAlign.center,
                      style: textoAcercaNosotros,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('images/gmail.png'),
                        ),
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('images/web-outlook.png'),
                        ),
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('images/web-whatsapp.png'),
                        ),
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('images/telegram.png'),
                        ),
                        Image(
                          width: 40,
                          height: 40,
                          image: AssetImage('images/web-facebook.png'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ));
  }
}
