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

final genderProvider = FutureProvider<List<DogGender>> ((ref) async {
   final listGenderDog = ref.read(getDogGenderUseCaseProvider);
   return listGenderDog();
  });

final energyLevelProvider = FutureProvider<List<EnergyLevelDog>>((ref) async {
  final listEnergyLevel = ref.read(getEnergyLevelUseCaseProvider);
  return await listEnergyLevel();
  });


final genderSelectedProvider = StateProvider<DogGender?>((ref) => null);
final energyLevelSelectedProvider = StateProvider<EnergyLevelDog?>((ref) => null);
