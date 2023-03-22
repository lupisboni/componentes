import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    //loadData();
  }

  Future<List<dynamic>> loadData() async {
    final respuesta = await rootBundle.loadString('data/menu_opciones.json');
    Map dataMap = json.decode(respuesta);
    print(dataMap['rutas']);
    opciones = dataMap['rutas'];
    return opciones;
  }

//  loadData(){
//   rootBundle.loadString('data/menu_opciones.json').then((data) {
//     //print(data);
//     Map dataMap = json.decode(data);
//     print(dataMap);
//     print(dataMap['nombreApp']);
//     print(dataMap['iconApp']);
//   });
//  }
}

final menuProvider = _MenuProvider();
