import 'package:project_dog_zizzi/core/constants/text_strings.dart';

class RegistryModel {
  final int ownerId; //Chiave esterna
  final String name;
  final int age;
  final String gender;
  final String breed;

  const RegistryModel({
    required this.ownerId,
    required this.name,
    required this.age,
    required this.gender,
    required this.breed,
  });

  Map<String, dynamic> toJson() =>{
    'ownerId': ownerId,
    'name': name,
    'age': age,
    'gender': gender,
    'breed': breed,
  };
}

class HealthModel {
  final String? allergy;
  final String? foodIntolerances;
  final String? typeFood;
  final String? pathologies;
  final String? notesHealth;

  const HealthModel({
    this.allergy,
    this.foodIntolerances,
    this.typeFood,
    this.pathologies,
    this.notesHealth,
  });

  Map<String, dynamic> toJson() => {
    'allergy': allergy ?? tNoAllergy,
    'foodIntolerances': foodIntolerances ?? tNoFoodIntolerances,
    'typeFood': typeFood ?? tNoTypeFood,
    'pathologies': pathologies ?? tNoPathologies,
    'notesHealth': notesHealth ?? tNoNotes,
  };
}

class BehaviorAndHabitsModel {
  final String? socialization;
  final String? fearsOrPhobias;
  final String? energyLevel;
  final String? notesBehavioral;

  const BehaviorAndHabitsModel({
    this.socialization,
    this.fearsOrPhobias,
    this.energyLevel,
    this.notesBehavioral,
  });

  Map<String, dynamic> toJson() => {
    'socialization': socialization ?? tNoField,
    'fearsOrPhobias': fearsOrPhobias ?? tNoFearsOrPhobies,
    'energyLevel': energyLevel ?? tNoField,
    'notesBehavioral': notesBehavioral ?? tNoNotes,
  };

}

class AddDogModel {
  final RegistryModel registry;
  final HealthModel health;
  final BehaviorAndHabitsModel behaviorAndHabits;

  const AddDogModel({
    required this.registry,
    required this.health,
    required this.behaviorAndHabits,
  });

  Map<String, dynamic> toJson() => {
    'registry': registry.toJson(),
    'health' : health.toJson(),
    'behaviorAndHabits' : behaviorAndHabits.toJson(),
    'createdAt': DateTime.now().toIso8601String(),
  };
}