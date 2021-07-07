import 'package:flutter/material.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Responsive
import 'package:recipe_app/src/responsive.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';
//Widgets
import 'package:recipe_app/src/widgets/app_bar_categoria.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBarCategoria(Text('Favoritos')),
          _gridFavoritos(context),
        ],
      ),
    );
  }
}

Widget _gridFavoritos(BuildContext context) {
  return Container(
    child: FutureBuilder(
      future: recetasProvider.cargarRecetasPopulares(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SliverGrid.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: 2,
          children: _favoritosListado(context, snapshot.data),
        );
      },
    ),
  );
}

List<Widget> _favoritosListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoFavoritos = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv = _tarjetaFavoritos(context, receta);
    listadoFavoritos.add(listadoWidgetProv);
  });

  return listadoFavoritos;
}

Widget _tarjetaFavoritos(BuildContext context, Map<String, dynamic> receta) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'detalle', arguments: receta);
    },
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: rosa.withOpacity(0.5),
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(receta['image']),
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
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.grey.withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Text(
                  receta['name'],
                  textAlign: TextAlign.center,
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
        ],
      ),
    ),
  );
}
