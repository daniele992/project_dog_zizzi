import '../../domain/entities/dog_energy_level.dart';

class EnergyLevelDogModel {
  final int id;
  final String name;
  final String code;

  EnergyLevelDogModel({
    required this.id,
    required this.name,
    required this.code
  });

  factory EnergyLevelDogModel.fromJson(Map<String, dynamic> json){
    return EnergyLevelDogModel(
        id: json['id'],
        name: json['name'],
        code: json['code']
    );
  }

  EnergyLevelDog toEntity(){
    return EnergyLevelDog(
      id: id,
      name: name,
      code: code
    );
  }


}