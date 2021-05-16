import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _RecetasProvider {
  List<dynamic> recetasPopulares = [];
  List<dynamic> categorias = [];

  Future<List<dynamic>> cargarRecetasPopulares() async {
    final resp = await rootBundle.loadString('data/recetas.json');
    Map<String, dynamic> recetasMap = json.decode(resp);
    recetasPopulares = recetasMap['recetasPopulares'];
    return recetasPopulares;
  }

  Future<List<dynamic>> cargarCategorias() async {
    final resp = await rootBundle.loadString('data/recetas.json');
    Map<String, dynamic> categoriasMap = json.decode(resp);
    categorias = categoriasMap['categorias'];
    return categorias;
  }
}

final recetasProvider = _RecetasProvider();
