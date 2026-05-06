class Dog {
  final int id;
  final int ownerId;
  final String name;
  final int age;
  final String gender;
  final String breed;
  final String socialization;
  final String fearsOrPhobias;
  final String energyLevel;
  final String notesHealth;
  final String allergy;
  final String foodIntolerances;
  final String pathologies;
  final String typeFood;
  final String notesBehavioral;
  final String? imageUrl;

  const Dog({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.age,
    required this.gender,
    required this.breed,
    required this.socialization,
    required this.fearsOrPhobias,
    required this.energyLevel,
    required this.notesHealth,
    required this.allergy,
    required this.foodIntolerances,
    required this.pathologies,
    required this.typeFood,
    required this.notesBehavioral,
    this.imageUrl,
  });



  Dog copyWith({
    int? id,
    int? ownerId,
    String? name,
    int? age,
    String? gender,
    String? breed,
    String? socialization,
    String? fearsOrPhobias,
    String? energyLevel,
    String? notesHealth,
    String? allergy,
    String? foodIntolerances,
    String? pathologies,
    String? typeFood,
    String? notesBehavioral,
    String? imageUrl,
  }) {
    return Dog(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      breed: breed ?? this.breed,
      socialization: socialization ?? this.socialization,
      fearsOrPhobias: fearsOrPhobias ?? this.fearsOrPhobias,
      energyLevel: energyLevel ?? this.energyLevel,
      notesHealth: notesHealth ?? this.notesHealth,
      allergy: allergy ?? this.allergy,
      foodIntolerances: foodIntolerances ?? this.foodIntolerances,
      pathologies: pathologies ?? this.pathologies,
      typeFood: typeFood ?? this.typeFood,
      notesBehavioral: notesBehavioral ?? this.notesBehavioral,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}