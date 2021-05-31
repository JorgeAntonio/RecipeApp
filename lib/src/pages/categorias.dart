import 'package:flutter/material.dart';
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/styles/styles.dart';
import 'package:recipe_app/src/viewModels/recetas_listado.dart';
import 'package:recipe_app/src/widgets/app_bar_categoria.dart';
import 'package:recipe_app/src/widgets/titles.dart';

class CategoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> categoria =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: colorBg,
      body: CustomScrollView(
        slivers: [
          appBarCategoria(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                titles(categoria['name'], titlesStyleCategoria),
                FutureBuilder(
                  future: recetasProvider.cargarCategoria(categoria['name']),
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Column(
                      children: recetasListado(context, snapshot.data),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
