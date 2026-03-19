import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/features/dog/domain/entities/dog_energy_level.dart';
import 'package:project_dog_zizzi/features/dog/domain/entities/dog_gender.dart';

import 'dog_providers.dart';

/*
* Carica i dati JSON dal bundle
* Converte ogni oggetto in un GenderDog
* Restituisce una lista List<GenderDog>
* è un future provider quindi si può usare asyncValue.when(...)
* */

final genderProvider = FutureProvider<List<GenderDog>> ((ref) async {
    final jsonStr = await rootBundle.loadString('assets/json/genderDog.json');
    final List list = jsonDecode(jsonStr);
    return list.map((e) => GenderDog.fromJson(e)).toList();
  });

final energyLevelProvider = FutureProvider<List<EnergyLevelDog>>((ref) async {
  final listEnergyLevel = ref.read(getEnergyLevelUseCaseProvider);
  return await listEnergyLevel();
  });


final genderSelectedProvider = StateProvider<GenderDog?>((ref) => null);
final energyLevelSelectedProvider = StateProvider<EnergyLevelDog?>((ref) => null);
