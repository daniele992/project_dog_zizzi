import 'package:project_dog_zizzi/data/models/addDogModel.dart';

//REGOLA D'ORO: Ogni volta che trasformi dati della UI in un Model → è un mapper di presentation

AddDogModel mapFormToAddDogModel({
required int ownerId,
required String name,
required int age,
required String gender,
required String breed,
required String allergy,
required String foodIntolerances,
required String typeFood,
required String pathologies,
required String notesHealth,
required String socialization,
required String fearsOrPhobias,
required String energyLevel,
required String notesBehavioral,
}) {
  return AddDogModel(
      registry: RegistryModel(
          ownerId: ownerId,
          name: name,
          age: age,
          gender: gender,
          breed: breed
      ),
      health: HealthModel(
        allergy: allergy,
        foodIntolerances: foodIntolerances,
        typeFood: typeFood,
        pathologies: pathologies,
        notesHealth: notesHealth,
      ),
      behaviorAndHabits: BehaviorAndHabitsModel(
        socialization: socialization,
        fearsOrPhobias: fearsOrPhobias,
        energyLevel: energyLevel,
        notesBehavioral: notesBehavioral,
      ),
  );
}