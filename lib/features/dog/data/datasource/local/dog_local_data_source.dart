import 'dart:convert';
import 'package:flutter/services.dart';

class DogLocalDataSource {
  Future<List<dynamic>> getEnergyLevels() async {
    final jsonStr = await rootBundle.loadString('assets/json/energyLevelDog.json');
    return jsonDecode(jsonStr);
  }

  Future<List<dynamic>> getDogGender() async {
    final jsonStr = await rootBundle.loadString('assets/json/genderDog.json');
    return   jsonDecode(jsonStr);
  }
}