import 'package:flutter/material.dart';
//Models
import 'package:recipe_app/src/models/recetas_listado.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/app_bar_with_text.dart';
import 'package:recipe_app/src/widgets/titlle_category.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> categoria =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          appBarWithText(
            titlesCategories(categoria['name'], 22, whiteColor),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FutureBuilder(
                  future: recetasProvider.cargarCategoria(categoria['name']),
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Column(
                      children: recetasListado(context, snapshot.data),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
