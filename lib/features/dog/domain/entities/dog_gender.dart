class GenderDog{
  final int id;
  final String name;
  final String code;

  GenderDog({
    required this.id,
    required this.name,
    required this.code
  });

  //Factory restituisce un oggetto o una sottoclasse esistente e non restituisce necessariamente un'istanza
  factory GenderDog.fromJson(Map<String, dynamic> json) {
    return GenderDog(
        id: json['id'],
        name: json['name'],
        code: json['code'],
    );
  }
}