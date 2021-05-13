import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return SliverAppBar(
    backgroundColor: Color.fromRGBO(244, 252, 255, 1.0),
    floating: false,
    title: CupertinoSearchTextField(
      placeholder: 'Buscar',
    ),
    leading: GestureDetector(
        onTap: () {
          key.currentState.openDrawer();
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Image(
            image: AssetImage('images/menu.png'),
            width: 10.0,
            height: 10.0,
          ),
        )),
    actions: [
      Container(
        padding: EdgeInsets.all(15.0),
        child: Icon(
          Icons.notifications,
          color: Color.fromRGBO(193, 195, 206, 1.0),
          size: 25,
        ),
      )
    ],
  );
}
