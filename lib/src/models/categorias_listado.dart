import 'package:flutter/material.dart';
//Provider
import 'package:recipe_app/src/provider/recetas_provider.dart';
//Estilos
import 'package:recipe_app/src/styles/styles.dart';

List<Widget> catergoriaListado(BuildContext context) {
  final List<Widget> listadoCategoria = [];
  final List<dynamic> categorias = recetasProvider.categorias;

  categorias.forEach((categoria) {
    final Widget widgetProv = _imageCategoria(context, categoria);
    listadoCategoria.add(widgetProv);
  });
  return listadoCategoria;
}

Widget _imageCategoria(BuildContext context, Map<String, dynamic> categoria) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'categoria', arguments: categoria);
    },
    child: Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: blanco,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(210, 211, 215, 1.0),
            offset: Offset(1, 5),
            blurRadius: 5.0,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('images/recipe1.jpg'),
                width: double.infinity,
                height: double.infinity,
                image: NetworkImage(categoria['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
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
