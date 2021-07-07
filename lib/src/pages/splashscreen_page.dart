import 'package:flutter/material.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, 'home');
    });

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: rosa,
        child: Center(
          child: Image(
            color: blanco,
            width: 100,
            height: 100,
            image: AssetImage('images/chef.png'),
          ),
        ),
      ),
    );
  }
}
