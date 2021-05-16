import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _RecetasProvider {
  List<dynamic> recetasPopulares = [];

  Future<List<dynamic>> cargarRecetasPopulares() async {
    final resp = await rootBundle.loadString('data/recetas.json');
    Map<String, dynamic> recetasMap = json.decode(resp);
    recetasPopulares = recetasMap['recetasPopulares'];
    //print(recetasPopulares);
    return recetasPopulares;
  }
}

final recetasProvider = _RecetasProvider();
