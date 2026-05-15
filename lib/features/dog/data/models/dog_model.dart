import '../../domain/entities/dog.dart';

//DogModel eredita tutte le proprietà di Dog. Quindi DogModel è un Dog + Funzionalità per JSON
class DogModel extends Dog {
  DogModel({
    required super.id, //I valori vengono passati al costruttore della classe padre (Dog) quindi inizalizziamo i campi dell'entity
    required super.ownerId,
    required super.name,
    required super.age,
    required super.gender,
    required super.breed,
    required super.socialization,
    required super.fearsOrPhobias,
    required super.energyLevel,
    required super.notesHealth,
    required super.allergy,
    required super.foodIntolerances,
    required super.pathologies,
    required super.typeFood,
    required super.notesBehavioral,
    super.imageUrl
  });

  //Funzione per JSON -> DogModel. Quindi API / DB -> JSON -> DogModel
  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      id: json['id'],
      ownerId: json['ownerId'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      breed: json['breed'],
      socialization: json['socialization'],
      fearsOrPhobias: json['fearsOrPhobias'],
      energyLevel: json['energyLevel'],
      notesHealth: json['notesHealth'],
      allergy: json['allergy'],
      foodIntolerances: json['foodIntolerances'],
      pathologies: json['pathologies'],
      typeFood: json['typeFood'],
      notesBehavioral: json['notesBehavioral'],
      imageUrl: json['imageUrl']
    );
  }

  //Funzione per convertire Dog -> DogModel perchè nella clean architecture Domain usa Dog e Data Layer usa DogModel
  factory DogModel.fromEntity(Dog dog) {
    return DogModel(
      id: dog.id,
      ownerId: dog.ownerId,
      name: dog.name,
      age: dog.age,
      gender: dog.gender,
      breed: dog.breed,
      socialization: dog.socialization,
      fearsOrPhobias: dog.fearsOrPhobias,
      energyLevel: dog.energyLevel,
      notesHealth: dog.notesHealth,
      allergy: dog.allergy,
      foodIntolerances: dog.foodIntolerances,
      pathologies: dog.pathologies,
      typeFood: dog.typeFood,
      notesBehavioral: dog.notesBehavioral,
      imageUrl: dog.imageUrl
    );
  }

  //Serve per fare l'opposto di fromJson
  Map<String, dynamic> toJson() => {
    "registry" : {
      "ownerId" : ownerId,
      "name": name,
      "age": age,
      "gender": gender,
      "breed": breed,
      "imageUrl": imageUrl
    },
    "health": {
      "allergy": allergy,
      "foodIntolerances": foodIntolerances,
      "typeFood": typeFood,
      "pathologies": pathologies,
      "notesHealth": notesHealth,
    },
    "behaviorAndHabits" : {
      "socialization": socialization,
      "fearsOrPhobias": fearsOrPhobias,
      "energyLevel": energyLevel,
      "notesBehavioral": notesBehavioral,
    }
  };
}