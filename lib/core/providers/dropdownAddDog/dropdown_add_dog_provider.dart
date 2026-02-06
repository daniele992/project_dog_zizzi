import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/data/models/dog_energy_level_model.dart';
import 'package:project_dog_zizzi/data/models/dog_gender_model.dart';

final genderProvider = FutureProvider<List<GenderDog>> ((ref) async {
    final jsonStr = await rootBundle.loadString('assets/json/genderDog.json');
    final List list = jsonDecode(jsonStr);
    return list.map((e) => GenderDog.fromJson(e)).toList();
  });

final energyLevelProvider = FutureProvider<List<EnergyLevelDog>>((ref) async{
  final jsonStr = await rootBundle.loadString('assets/json/energyLevelDog.json');
  final List list = jsonDecode(jsonStr);
  return list.map((e) => EnergyLevelDog.fromJson(e)).toList();
});


final genderSelectedProvider = StateProvider<GenderDog?>((ref) => null);
final energyLevelSelectedProvider = StateProvider<EnergyLevelDog?>((ref) => null);
