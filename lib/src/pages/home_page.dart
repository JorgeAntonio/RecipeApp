import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
import 'package:recipe_app/src/responsive.dart';
//ViewModels
//Widgets
import 'package:recipe_app/src/widgets/app_bar.dart';
import 'package:recipe_app/src/widgets/menu_lateral.dart';
//import 'package:recipe_app/src/widgets/swiper_populares.dart';
import 'package:recipe_app/src/widgets/titles.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menuLateral(context),
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        appBar: appBar(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: titles('Populares', 24, rosa),
                  ),
                  SizedBox(height: 10),
                  _sliderPopulares(context),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: titles('Categorias', 24, rosa),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            _gridCategorias(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _sliderPopulares(BuildContext context) {
  final controller = PageController(
    viewportFraction: 0.4,
  );
  return Container(
    decoration: BoxDecoration(color: backgroundColor),
    width: isMobile(context) ? 120 : 150,
    height: isMobile(context) ? 180 : 200,
    child: Swiper(
      viewportFraction: 1.0,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
            future: recetasProvider.cargarRecetasPopulares(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: _popularesListado(context, snapshot.data),
              );
            });
      },
      index: 3,
    ),
  );
}

List<Widget> _popularesListado(
    BuildContext context, List<dynamic> recetasPopulares) {
  final List<Widget> listadoRecetas = [];

  recetasPopulares.forEach((receta) {
    final listadoWidgetProv = _tarjetaCollection(context, receta);
    listadoRecetas.add(listadoWidgetProv);
  });

  return listadoRecetas;
}

Widget _tarjetaCollection(BuildContext context, Map<String, dynamic> receta) {
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
            color: rosa,
            offset: Offset(1, 5),
            blurRadius: 3,
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
                width: isMobile(context) ? 120 : 150,
                height: isMobile(context) ? 180 : 200,
              ),
            ),
          ),
          Container(
            width: isMobile(context) ? 120 : 150,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              receta['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.black,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _gridCategorias(BuildContext context) {
  return Container(
    child: FutureBuilder(
      future: recetasProvider.cargarCategorias(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SliverGrid.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 3,
          children: _catergoriaListado(context),
        );
      },
    ),
  );
}

List<Widget> _catergoriaListado(BuildContext context) {
  final List<Widget> listadoCategoria = [];
  final List<dynamic> categorias = recetasProvider.categorias;

  categorias.forEach((categoria) {
    final Widget widgetProv = _imageCategoria(context, categoria);
    listadoCategoria.add(widgetProv);
  });
  return listadoCategoria;
}

Widget _imageCategoria(BuildContext context, Map<String, dynamic> categoria) {
  return Card(
    shadowColor: rosa,
    elevation: 5,
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'categoria', arguments: categoria);
      },
      splashColor: rosa,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                width: double.infinity,
                height: double.infinity,
                image: NetworkImage(categoria['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(20),
            child: Text(
              categoria['name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
