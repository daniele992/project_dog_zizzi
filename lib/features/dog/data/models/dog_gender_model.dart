import '../../domain/entities/dog_gender.dart';

class DogGenderModel {
  final int id;
  final String name;
  final String code;

  DogGenderModel({
    required this.id,
    required this.name,
    required this.code,
  });

  //Factory restituisce un oggetto o una sottoclasse esistente e non restituisce necessariamente un'istanza
  factory DogGenderModel.fromJson(Map<String, dynamic> json) {
    return DogGenderModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }

  DogGender toEntity(){
    return DogGender(
        id: id,
        name: name,
        code: code
    );
  }

}