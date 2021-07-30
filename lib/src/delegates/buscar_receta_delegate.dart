import 'package:flutter/material.dart';
import 'package:recipe_app/src/models/recetas_buscador_viewmodal.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/styles/styles.dart';

class RecetasSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        color: primaryColor,
      ),
      textTheme: theme.primaryTextTheme,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        labelStyle: theme.textTheme.caption?.copyWith(color: whiteColor),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.transparent, style: BorderStyle.none)),
        hintStyle: TextStyle(
          color: whiteColor,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          this.query = '';
        },
        icon: Icon(
          Icons.clear,
          color: whiteColor,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        this.close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: whiteColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: recetasProvider.cargarRecetasTodos(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        List? recetas = snapshot.data;
        var recetaBuscada = this.query.toLowerCase();
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: recetasListadoBuscador(
                        context, recetas!, recetaBuscada),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Text(
            'Busca tu receta favorita...',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image(
          width: 150,
          height: 150,
          image: AssetImage('images/chef_logo.png'),
        ),
      ],
    );
  }
}
