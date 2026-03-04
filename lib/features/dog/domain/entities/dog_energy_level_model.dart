class EnergyLevelDog {
  final int id;
  final String name;
  final String code;

  EnergyLevelDog({
    required this.id,
    required this.name,
    required this.code
  });

  //Factory restituisce un oggetto o una sottoclasse esistente e non restituisce necessariamente un'istanza
  factory EnergyLevelDog.fromJson(Map<String, dynamic> json) {
    return EnergyLevelDog(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }
}