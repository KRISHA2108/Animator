import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import '../modals/planetmodal.dart';

class JsonHelper {
  JsonHelper._();
  static final JsonHelper jsonHelper = JsonHelper._();

  Future<List<PlanetModal>> getPlanetData() async {
    String data = await rootBundle.loadString('assets/json/planet_data.json');
    List planet = jsonDecode(data);
    log('json Data : ${planet.runtimeType}');
    List<PlanetModal> allPlanet =
        planet.map((e) => PlanetModal.fromMap(planet: e)).toList();
    log('data Gated');
    return allPlanet;
  }
}
